import random
import names
import string

f=open("dataSQL.txt","a")
h=open("dataSQLSybase.txt","a")
g=open("dataSQLOracle.txt","a")

for x in range(15):
    cedula = random.randint(39000000,1111111111)
    nombres = names.get_first_name(gender="female") + " " + names.get_first_name(gender="female")
    apellidos = names.get_last_name() + " " +names.get_last_name()
    fijo = random.randint(1000000,9999999)
    celular = ("3"+str(random.randint(100000000,999999999)))
    direccion = "Cll " + str(random.randint(1,230)) + random.choice(" ABCDE") + " " + random.choice([" ","Sur"]) + " Cra " + str(random.randint(1,100)) + random.choice(" ABCDE")
    genero = "Femenino"
    correo = (nombres[0] + apellidos.split(" ")[0] + "@ventascolombia.co").lower()
    ingresoEmpresa = str(random.randint(1,28)) + "/" + random.choice(["01","02","03","04","05","06","07","08","09","10","11","12"]) + "/" + str(random.randint(1990,2018))
    departamento = random.choice(["Juridico","Recursos Humanos","Contabilidad","Mercadeo","Sistemas e Informatica", "Ventas", "Ventas", "Ventas","Produccion", "Empaque"])

    if departamento == "Recursos Humanos":
        cargo = random.choice(["Psicologia","Contratacion","Asesor de Personal"])
        salario = random.choice(["15","20","25","27","30","35","37","40"]) + "00000"
    elif departamento == "Empaque":
        cargo = random.choice(["Revisor"])
        salario = random.choice(["35"]) + "00000"
    elif departamento == "Produccion":
        cargo = random.choice(["Manofactura","Encargado de Maquinas"])
        salario = random.choice(["20","15"]) + "00000"
    elif departamento == "Juridico":
        cargo = random.choice(["Asesor Juridico","Representante Legal"])
        salario = random.choice(["65","70"]) + "00000"
    elif departamento == "Contabilidad":
        cargo = random.choice(["Contador","Auditor","Asesor Contable"])
        salario = random.choice(["15","20","25","27","30","35","37","40"]) + "00000"
    elif departamento == "Mercadeo":
        cargo = random.choice(["CDO","estratega del contenido","Asesor de Mercadeo","Community Manager"])
        salario = random.choice(["25","30","35","37","40","45","47","50"]) + "00000"
    elif departamento == "Sistemas e Informatica":
        cargo = random.choice(["Software Developer","Web Developer","Director de DevOps","Administrador de DB"])
        salario = random.choice(["25","30","35","37","40","45","47","50"]) + "00000"
    elif departamento == "Ventas":
        cargo = random.choice(["Vendedor Voz a Voz","Vendedor Call Center","Web Seller"])
        salario = random.choice(["25","20"]) + "00000"

    if  departamento == "Ventas":
        Comision =  str(random.randint(5,15)) + "%"
        docCl1 = random.choice([random.randint(39000000,1111111111)])
        if not docCl1 is "null":
            NClie1 = names.get_full_name()
            Tclie1 = random.randint(1000000,9999999)
        else:
            NClie1 = "null"
            Tclie1 = "null"
        docCl2 = random.choice(["null",random.randint(39000000,1111111111)])
        if not docCl2 is "null":
            NClie2 = names.get_full_name()
            Tclie2 = random.randint(1000000,9999999)
        else:
            NClie2 = "null"
            Tclie2 = "null"
        docCl3 = random.choice(["null",random.randint(39000000,1111111111)])
        if not docCl3 is "null":
            NClie3 = names.get_full_name()
            Tclie3 = random.randint(1000000,9999999)
        else:
            NClie3 = "null"
            Tclie3 = "null"
    else:
        Comision = "null"
        docCl1 = "null"
        NClie1 = "null"
        Tclie1 = "null"
        docCl2 = "null"
        NClie2 = "null"
        Tclie2 = "null"
        docCl3 = "null"
        NClie3 = "null"
        Tclie3 = "null"

    data = str("insert into jugonzalezv.VISTA_1 values (" + str(cedula) + ",\"" + nombres + "\", \"" + apellidos + "\" , " + str(fijo)  + ", " + str(celular) + " , \"" + direccion + "\" , \"" +  genero + "\" , \"" +  correo + "\" , \"" +  str(ingresoEmpresa) + "\" , \"" + departamento + "\" , \""  +  cargo  +  " \" , " +  str(salario) +  " , \""  +  Comision + "\" ," +  str(docCl1) + ", \" " + NClie1 + " \" , " + str(Tclie1) + ", " + "\" ," +  str(docCl2) + ", \" " +  NClie2 +  " \" , " + str(Tclie2) + ", " + "\" ," +  str(docCl3) + ", \" " +  str(NClie3) +  " \" , " + str(Tclie3) + " ) \n").replace("\" ,null, \"",", null ,").replace("null \"", "null ").replace("\"null", " null").replace(", \" ,", " , ").replace(", ,",",")
    print (data)
    f.write(data.replace("\"","'"))
    oracle = data.replace("\n",";\n")
    g.write(oracle)
    data = str("insert into jugonzalezv.VISTA_1 values (" + str(cedula) + ",\"" + nombres + "\", \"" + apellidos + "\" , " + str(fijo)  + ", " + str(celular) + " , \"" + direccion + "\" , \"" +  genero + "\" , \"" +  correo + "\" , \"" +  (str(ingresoEmpresa).split("/")[1] + "/" + str(ingresoEmpresa).split("/")[0]+ "/" + str(ingresoEmpresa).split("/")[2]) + "\" , \"" + departamento + "\" , \""  +  cargo  +  " \" , " +  str(salario) +  " , \""  +  Comision + "\" ," +  str(docCl1) + ", \" " + NClie1 + " \" , " + str(Tclie1) + ", " + "\" ," +  str(docCl2) + ", \" " +  NClie2 +  " \" , " + str(Tclie2) + ", " + "\" ," +  str(docCl3) + ", \" " +  str(NClie3) +  " \" , " + str(Tclie3) + " ) \n").replace("\" ,null, \"",", null ,").replace("null \"", "null ").replace("\"null", " null").replace(", \" ,", " , ").replace(", ,",",")
    h.write(data)

for x in range(15):
    cedula = random.randint(39000000,1111111111)
    nombres = names.get_first_name(gender="male") + " " + names.get_first_name(gender="male")
    apellidos = names.get_last_name() +" "+ names.get_last_name()
    fijo = random.randint(1000000,9999999)
    celular = ("3"+str(random.randint(100000000,999999999)))
    direccion = "Cll " + str(random.randint(1,230)) + random.choice(" ABCDE") + " " + random.choice([" ","Sur"]) + " Cra " + str(random.randint(1,100)) + random.choice(" ABCDE")
    genero = "Masculino"
    correo = (nombres.split(" ")[0]+ "." + apellidos.split(" ")[0] + "@ventascolombia.co").lower()
    ingresoEmpresa = str(random.randint(1,28)) + "/" + random.choice(["01","02","03","04","05","06","07","08","09","10","11","12"]) + "/" + str(random.randint(1990,2018))
    departamento = random.choice(["Juridico","Recursos Humanos","Contabilidad","Mercadeo","Sistemas e Informatica", "Ventas", "Ventas", "Ventas","Produccion", "Empaque"])

    if departamento == "Recursos Humanos":
        cargo = random.choice(["Psicologia","Contratacion","Asesor de Personal"])
        salario = random.choice(["15","20","25","27","30","35","37","40"]) + "00000"
    elif departamento == "Empaque":
        cargo = random.choice(["Revisor"])
        salario = random.choice(["35"]) + "00000"
    elif departamento == "Produccion":
        cargo = random.choice(["Manofactura","Encargado de Maquinas"])
        salario = random.choice(["20","15"]) + "00000"
    elif departamento == "Juridico":
        cargo = random.choice(["Asesor Juridico","Representante Legal"])
        salario = random.choice(["65","70"]) + "00000"
    elif departamento == "Contabilidad":
        cargo = random.choice(["Contador","Auditor","Asesor Contable"])
        salario = random.choice(["15","20","25","27","30","35","37","40"]) + "00000"
    elif departamento == "Mercadeo":
        cargo = random.choice(["CDO","estratega del contenido","Asesor de Mercadeo","Community Manager"])
        salario = random.choice(["25","30","35","37","40","45","47","50"]) + "00000"
    elif departamento == "Sistemas e Informatica":
        cargo = random.choice(["Software Developer","Web Developer","Director de DevOps","Administrador de DB"])
        salario = random.choice(["25","30","35","37","40","45","47","50"]) + "00000"
    elif departamento == "Ventas":
        cargo = random.choice(["Vendedor Voz a Voz","Vendedor Call Center","Web Seller"])
        salario = random.choice(["25","20"]) + "00000"

    if  departamento == "Ventas":
        Comision =  str(random.randint(5,15)) + "%"
        docCl1 = random.choice([random.randint(39000000,1111111111)])
        if not docCl1 is "null":
            NClie1 = names.get_full_name()
            Tclie1 = random.randint(1000000,9999999)
        else:
            NClie1 = "null"
            Tclie1 = "null"
        docCl2 = random.choice(["null",random.randint(39000000,1111111111)])
        if not docCl2 is "null":
            NClie2 = names.get_full_name()
            Tclie2 = random.randint(1000000,9999999)
        else:
            NClie2 = "null"
            Tclie2 = "null"
        docCl3 = random.choice(["null",random.randint(39000000,1111111111)])
        if not docCl3 is "null":
            NClie3 = names.get_full_name()
            Tclie3 = random.randint(1000000,9999999)
        else:
            NClie3 = "null"
            Tclie3 = "null"
    else:
        Comision = "null"
        docCl1 = "null"
        NClie1 = "null"
        Tclie1 = "null"
        docCl2 = "null"
        NClie2 = "null"
        Tclie2 = "null"
        docCl3 = "null"
        NClie3 = "null"
        Tclie3 = "null"

    data = str("insert into jugonzalezv.VISTA_1 values (" + str(cedula) + ",\"" + nombres + "\", \"" + apellidos + "\" , " + str(fijo)  + ", " + str(celular) + " , \"" + direccion + "\" , \"" +  genero + "\" , \"" +  correo + "\" , \"" +  str(ingresoEmpresa) + "\" , \"" + departamento + "\" , \""  +  cargo  +  " \" , " +  str(salario) +  " , \""  +  Comision + "\" ," +  str(docCl1) + ", \" " + NClie1 + " \" , " + str(Tclie1) + ", " + "\" ," +  str(docCl2) + ", \" " +  NClie2 +  " \" , " + str(Tclie2) + ", " + "\" ," +  str(docCl3) + ", \" " +  str(NClie3) +  " \" , " + str(Tclie3) + " ) \n").replace("\" ,null, \"",", null ,").replace("null \"", "null ").replace("\"null", " null").replace(", \" ,", " , ").replace(", ,",",")
    print (data)
    f.write(data.replace("\"","'"))
    oracle = data.replace("\n",";\n")
    g.write(oracle)
    data = str("insert into jugonzalezv.VISTA_1 values (" + str(cedula) + ",\"" + nombres + "\", \"" + apellidos + "\" , " + str(fijo)  + ", " + str(celular) + " , \"" + direccion + "\" , \"" +  genero + "\" , \"" +  correo + "\" , \"" +  (str(ingresoEmpresa).split("/")[1] + "/" + str(ingresoEmpresa).split("/")[0]+ "/" + str(ingresoEmpresa).split("/")[2]) + "\" , \"" + departamento + "\" , \""  +  cargo  +  " \" , " +  str(salario) +  " , \""  +  Comision + "\" ," +  str(docCl1) + ", \" " + NClie1 + " \" , " + str(Tclie1) + ", " + "\" ," +  str(docCl2) + ", \" " +  NClie2 +  " \" , " + str(Tclie2) + ", " + "\" ," +  str(docCl3) + ", \" " +  str(NClie3) +  " \" , " + str(Tclie3) + " ) \n").replace("\" ,null, \"",", null ,").replace("null \"", "null ").replace("\"null", " null").replace(", \" ,", " , ").replace(", ,",",")
    h.write(data)

g.close()
f.close()
h.close()
