from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
import eel
eel.init('web')
g = open("schema_pad.txt","r")

def processJS(lec):
    count = 0

    matrix = []

    for lines in lec.split("\n"):
        if ("|P" in lines and not "|Pin Number|" in lines):
            lineInfo = []
            lineInfo.append(lines.split("|")[1].replace(" ",""))
            lineInfo.append(lines.split("|")[2].replace(" ",""))
            lineInfo.append(lines.split("|")[5].replace(" ",""))
            if(lineInfo[0] == 'P91'):
                lineInfo.append("C00")
            if(lineInfo[0] == 'P92'):
                lineInfo.append("C01")
            if(lineInfo[0] == 'P94'):
                lineInfo.append("C02")
            if(lineInfo[0] == 'P95'):
                lineInfo.append("C03")
            if(lineInfo[0] == 'P98'):
                lineInfo.append("C04")
            if(lineInfo[0] == 'P2'):
                lineInfo.append("C05")
            if(lineInfo[0] == 'P3'):
                lineInfo.append("C06")
            if(lineInfo[0] == 'P4'):
                lineInfo.append("C07")
            if(lineInfo[0] == 'P5'):
                lineInfo.append("C08")
            if(lineInfo[0] == 'P9'):
                lineInfo.append("C09")
            if(lineInfo[0] == 'P10'):
                lineInfo.append("C10")
            if(lineInfo[0] == 'P11'):
                lineInfo.append("C11")
            if(lineInfo[0] == 'P12'):
                lineInfo.append("C12")
            if(lineInfo[0] == 'P15'):
                lineInfo.append("C13")
            if(lineInfo[0] == 'P16'):
                lineInfo.append("C14")
            if(lineInfo[0] == 'P17'):
                lineInfo.append("C15")

            if(lineInfo[0] == 'P85'):
                lineInfo.append("B00")
            if(lineInfo[0] == 'P83'):
                lineInfo.append("B01")
            if(lineInfo[0] == 'P78'):
                lineInfo.append("B02")
            if(lineInfo[0] == 'P71'):
                lineInfo.append("B03")
            if(lineInfo[0] == 'P68'):
                lineInfo.append("B04")
            if(lineInfo[0] == 'P66'):
                lineInfo.append("B05")
            if(lineInfo[0] == 'P63'):
                lineInfo.append("B06")
            if(lineInfo[0] == 'P61'):
                lineInfo.append("B07")
            if(lineInfo[0] == 'P58'):
                lineInfo.append("B08")
            if(lineInfo[0] == 'P54'):
                lineInfo.append("B09")
            if(lineInfo[0] == 'P41'):
                lineInfo.append("B10")
            if(lineInfo[0] == 'P36'):
                lineInfo.append("B11")
            if(lineInfo[0] == 'P34'):
                lineInfo.append("B12")
            if(lineInfo[0] == 'P32'):
                lineInfo.append("B13")
            if(lineInfo[0] == 'P25'):
                lineInfo.append("B14")
            if(lineInfo[0] == 'P22'):
                lineInfo.append("B15")

            if(lineInfo[0] == 'P18'):
                lineInfo.append("A00")
            if(lineInfo[0] == 'P23'):
                lineInfo.append("A01")
            if(lineInfo[0] == 'P26'):
                lineInfo.append("A02")
            if(lineInfo[0] == 'P33'):
                lineInfo.append("A03")
            if(lineInfo[0] == 'P35'):
                lineInfo.append("A04")
            if(lineInfo[0] == 'P40'):
                lineInfo.append("A05")
            if(lineInfo[0] == 'P53'):
                lineInfo.append("A06")
            if(lineInfo[0] == 'P57'):
                lineInfo.append("A07")
            if(lineInfo[0] == 'P60'):
                lineInfo.append("A08")
            if(lineInfo[0] == 'P62'):
                lineInfo.append("A09")
            if(lineInfo[0] == 'P65'):
                lineInfo.append("A10")
            if(lineInfo[0] == 'P67'):
                lineInfo.append("A11")
            if(lineInfo[0] == 'P70'):
                lineInfo.append("A12")
            if(lineInfo[0] == 'P79'):
                lineInfo.append("A13")
            if(lineInfo[0] == 'P84'):
                lineInfo.append("A14")
            if(lineInfo[0] == 'P86'):
                lineInfo.append("A15")

            if(lines.split("|")[2].replace(" ","")):
                matrix.append(lineInfo)

    for x in matrix:
        print(x)
        try:
            superpose(x[3], (x[1] + " - " + x[3]))
        except Exception as e:
            print(e)



try:
    img = Image.open("fpga.png")
    img.save("procesed.png")
except Exception as e:
    pass

def superpose(pin, content):
    try:
        #Relative Path
        #Image on which we want to paste

        img = Image.open("procesed.png")
        #Relative Path
        #Image which we want to paste
        arrow = "arrow" + str(int(pin.replace('C','').replace('A','').replace('B',''))%2)+".png"
        img2 = Image.open(arrow)
        size = int(100 / ((len(content))))*2
        if ("A" in pin):
            img2 = img2.rotate(180)
            pos =  140
        else:
            pos = 0

        fnt = ImageFont.truetype('BAHNSCHRIFT.ttf', size)
        d = ImageDraw.Draw(img2)
        if(len(content) > 10):
            temp = content.split(" - ")
            size = int(100 / ((len(temp[0]))))+2
            fnt = ImageFont.truetype('BAHNSCHRIFT.ttf', size)
            d.text((pos,0), temp[0], font=fnt, fill=(61, 16, 123))
            d.text((pos,15), temp[1], font=fnt, fill=(61, 16, 123))
        else:
            d.text((pos,3), content, font=fnt, fill=(61, 16, 123))
        if ("C" in pin):
            hub = pin.replace('C','')

            if(int(hub) < 4 ):
                hub = (int(hub)*33)+530
                img.paste(img2, (25, hub))
            elif(int(hub) < 9):
                hub = (int(hub)*32)+530
                img.paste(img2, (25, hub))
            elif(int(hub) < 12):
                hub = (int(hub)*32.5)+530
                img.paste(img2, (25, int(hub)))
            elif(int(hub) < 14):
                hub = (int(hub)*32.7)+530
                img.paste(img2, (25, int(hub)))
            else:
                hub = (int(hub)*32.8)+530
                img.paste(img2, (25, int(hub)))

        if ("B" in pin):
            hub = pin.replace('B','')
            if(int(hub) < 4 ):
                hub = (int(hub)*33)+528
                img.paste(img2, (707, hub))
            elif(int(hub) < 9):
                hub = (int(hub)*32)+530
                img.paste(img2, (707, hub))
            elif(int(hub) < 12):
                hub = (int(hub)*32.5)+530
                img.paste(img2, (707, int(hub)))
            elif(int(hub) < 14):
                hub = (int(hub)*32.7)+530
                img.paste(img2, (707, int(hub)))
            else:
                hub = (int(hub)*32.8)+530
                img.paste(img2, (707, int(hub)))

        if ("A" in pin):
            hub = pin.replace('A','')
            hub = 15 - int(hub)
            if(int(hub) < 11 ):
                hub = (int(hub)*32.1)+528
                img.paste(img2, (936, int(hub)))
            if(int(hub) < 15 ):
                hub = (int(hub)*32.3)+528
                img.paste(img2, (936, int(hub)))
            else:
                hub = (int(hub)*32.7)+528
                img.paste(img2, (936, int(hub)))
        #Saved in the same relative location
        img.save("procesed.png")

    except IOError:
        pass



processJS(g.read())


@eel.expose
def testT(test):
    print(test)

eel.start('index.html')
