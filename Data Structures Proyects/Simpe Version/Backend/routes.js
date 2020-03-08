'use strict';
const { Client } = require('@elastic/elasticsearch')
const client = new Client({ node: 'http://elastic:FARpud68@186.155.159.69:9200' })

const router = require('express').Router();
const middleware = require('./src/middleware');
const errors = require('./src/errors');
const healthRouter = require('./src/health/router');
const taskRouter = require('./src/tasks/router');


// Funciotns
async function updatePackage(data){
  console.log(data);
  const result = await client.search({
    index: 'delivery-2020',
    body: {
      query: {
        match: {
          registrationTag: data.user
        }
      }
    }
    }, {
    ignore: [404],
    maxRetries: 3
  })
  let list = result.body.hits.hits[0]._source.packageList
  for(var i = list.length - 1; i >= 0; i--) {
    if(list[i] == data.code) {
        list.splice(i, 1);
    }
  }
  await client.update({
    id: result.body.hits.hits[0]._id,
    index: 'delivery-2020',
    body: {
      doc:{
        packageList: list
      }
    }
  })
}

async function searchElastic(user){
  const result = await client.search({
    index: 'delivery-2020',
    body: {
      query: {
        match: {
          registrationTag: user
        }
      }
    }
    }, {
    ignore: [404],
    maxRetries: 3
  })
  return result
}

async function searchOrders(id){
  const result = await client.search({
    index: 'orders',
    body: {
      query: {
        match: {
          _id: id
        }
      }
    }
    }, {
    ignore: [404],
    maxRetries: 3
  })
  return result
}

function haversine_distance(mk1, mk2) {
      var R = 3958.8; // Radius of the Earth in miles
      var rlat1 = mk1.lat * (Math.PI/180); // Convert degrees to radians
      var rlat2 = mk2.lat * (Math.PI/180); // Convert degrees to radians
      var difflat = rlat2-rlat1; // Radian difference (latitudes)
      var difflon = (mk2.lon-mk1.lon) * (Math.PI/180); // Radian difference (longitudes)

      var d = 2 * R * Math.asin(Math.sqrt(Math.sin(difflat/2)*Math.sin(difflat/2)+Math.cos(rlat1)*Math.cos(rlat2)*Math.sin(difflon/2)*Math.sin(difflon/2)));
      return d;
    }


// Wire up middleware
router.use(middleware.doSomethingInteresting);

// Wire up routers
router.use('/health', healthRouter);

router.get('/API/version', (req, res) => {
    const data = {
        proyect: 'delivery-2020',
        version: 0.1
    };
    res.json(data);
});

router.post('/API/route', (req, res) => {
    async function genRoute() {
      try {
          console.log(req.body);
          let response = await searchElastic(req.body.user)
          console.log(response.body.hits.hits[0])
          let location = {
            lat: req.body.lat,
            lon: req.body.lon
          }
          let dis = 10000000000000
          let point = {}
          let packageId = ""
          for (var list in response.body.hits.hits[0]._source.packageList) {
              let order = await searchOrders(response.body.hits.hits[0]._source.packageList[list])
              let locationPackage = order.body.hits.hits[0]._source.location
              if (haversine_distance(location, locationPackage) < dis) {
                dis = haversine_distance(location, locationPackage)
                point = locationPackage
                packageId = response.body.hits.hits[0]._source.packageList[list]
              }
          }
          point.id = packageId;
          console.log(point);
          res.json(point)
      } catch (e) {
        console.log(e);
        res.json({error: "Wrong"});
      }
    }
    genRoute()
});

router.post('/API/delivery', (req, res) => {
    async function deliver() {
      try {
          console.log(req.body);
          let response = await updatePackage(req.body)
          res.json({"state":200})
      } catch (e) {
        console.log(e);
        res.json({error: "Wrong"});
      }
    }
    deliver()
});


// Wire up error-handling middleware
router.use(errors.errorHandler);
router.use(errors.nullRoute);


// Export the router
module.exports = router;
