
from copyreg import add_extension
from email.message import EmailMessage
from operator import contains
import os
from random import randint
from corsheaders import django
from django.shortcuts import HttpResponse, redirect
from smtplib import SMTPResponseException
from django.http import response
from django.shortcuts import render
import hashlib
from agri.models import Broker,Amenities, Buyer, Seller
from django.core.mail import send_mail

def layout(request):
    return render(request,"layout.html")


def contact(request):

    name=request.GET.get('name') 
    email=request.GET.get('email') 
    subject=request.GET.get('subject')
    comment=request.GET.get('comment')

    print("hi")
    res = send_mail("Contact", "The contact had the name   "+str(name)+"   email:  "+str(email)+"    subject  "+str(subject)+"    comment     "+str(comment)+".", "#enter_your_email_here", ["#enter_your_email_here"])
    str3='''
    <h2>Your contact was mailed to the admin</h2>
     <a href="/home"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> Go back to home page </button></a>
    '''
    
    return HttpResponse(str3)


# Create your views here.

def home(request):
    return render(request,"home.html")


#broker login related bellow:
def ulogin(request):
    uname=request.GET.get('usname')
    pwd=request.GET.get('psw') 
    pwd=hashlib.md5(pwd.encode('utf-8')).hexdigest()
    print(uname,pwd)
    u=Broker.objects.filter(Brname=uname,password=pwd)

    if(u):
        response=render(request,'Brokerpage.html',{"uname":uname})
        response.set_cookie('usname',uname)
        
        return response
    else:
        print("wrong username or password")

        return render(request,'brokerloginpage.html')


def login(request):
    return render(request, 'login.html')


#Buyer login related bellow:


def uloginB(request):
    Bname=request.GET.get('Bname')
    pwd=request.GET.get('psw') 
    pwd=hashlib.md5(pwd.encode('utf-8')).hexdigest()
    print(Bname,pwd)
    u=Buyer.objects.filter(Bname=Bname,password=pwd)

    if(u):      
        response=render(request,'lands.html')
        response.set_cookie('Bname',Bname)
        
        return response
    else:
        print("wrong username or password")
        return render(request,'buyerloginpage.html')
        

def loginB(request):
    return render(request, 'loginB.html')

#Seller login related below:
 
def uloginS(request):
    Sname=request.GET.get('Sname')
    pwd=request.GET.get('psw') 
    pwd=hashlib.md5(pwd.encode('utf-8')).hexdigest()
    print(Sname,pwd)
    u=Seller.objects.filter(Sname=Sname,password=pwd)

    if(u):      
        response=render(request,'addLand.html')
        response.set_cookie('Sname',Sname)
        
        return response
    else:
        print("wrong username or password")
        return render(request,'sellerloginpage.html')


def loginS(request):
    return render(request, 'loginS.html')




#Broker register related bellow

def ureg(request):

    uname=request.GET.get('usrname') 
    pwd=request.GET.get('psw') 
    pwd=hashlib.md5(pwd.encode('utf-8')).hexdigest()
    Addres=request.GET.get('Address')
    phoe=request.GET.get('phone')

    print(uname,pwd,Addres,phoe) 
    u=Broker(Brname=uname,password=pwd,address=Addres,Brphone_number=phoe)

    u.save()
    u=Broker.objects.get(address=Addres)
    res = send_mail("Regsitration", "Congratulations!. Your registration is successfull and your Broker id is "+str(u.BrokerID), "#enter_your_email_here", [Addres])


    return render(request,'brokerloginpage.html')


#Buyer register related bellow:
    
def uregB(request):

    uname=request.GET.get('usrname') 
    pwd=request.GET.get('psw') 
    pwd=hashlib.md5(pwd.encode('utf-8')).hexdigest()
    Addres=request.GET.get('Address')
    phoe=request.GET.get('phone')

    print(uname,pwd,Addres,phoe) 
    u=Buyer(Bname=uname,password=pwd,Baddress=Addres,Bphone_number=phoe)

    u.save()
    u=Buyer.objects.get(Baddress=Addres)
    res = send_mail("Regsitration", "Congratulations!. Your registration is successfull and your Buyer id is "+str(u.BuyerID), "#enter_your_email_here", [Addres])

    return render(request,'buyerloginpage.html')



#Seller register related bellow:
    
def uregS(request):

    uname=request.GET.get('usrname') 
    pwd=request.GET.get('psw') 
    pwd=hashlib.md5(pwd.encode('utf-8')).hexdigest()
    Addres=request.GET.get('Address')
    phoe=request.GET.get('phone')

    print(uname,pwd,Addres,phoe) 
    u=Seller(Sname=uname,password=pwd,Saddress=Addres,Sphone_number=phoe)

    u.save()
    u=Seller.objects.get(Saddress=Addres)
    res = send_mail("Regsitration", "Congratulations!. Your registration is successfull and your Seller id is "+str(u.SellerID), "#enter_your_email_here", [Addres])
    return render(request,'sellerloginpage.html')


#Seller adds details of land

def SaddS(request):
 
    Address=request.GET.get('Address') 
    Soil_type=request.GET.get('Soil_type') 
    water_sources=request.GET.get('water_sources')
    Land_area=request.GET.get('Land_area')
    suitable_crop=request.GET.get('suitable_crop') 
    weather=request.GET.get('weather') 
    protection_type=request.GET.get('protection_type')
    Amount=request.GET.get('Amount')

    u=Amenities(Address=Address,
    Soil_type=Soil_type,
    water_sources=water_sources,
    Land_area=Land_area,
    suitable_crop=suitable_crop,
    weather=weather,
    protection_type=protection_type,
    Amount=Amount)

    u.save()

    istr = '''
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

            $.get("http://localhost:8000/Sadd/",{Address:Address}).done(function(data)
                {
                    $("body").html(data)
                });

    </script>

'''    
    
    return HttpResponse(istr)


def Sadd(request):
    Sname = request.COOKIES.get('Sname')
    Address=request.GET.get('Address')
    a = Amenities.objects.filter(Address=Address)
    print(a)
    c = Seller.objects.filter(Sname=Sname)
    a.first().containss.add(c.first())
    e=str(Sname)
    f=str(Address)

    str3='''
    <h2>You just put up a land for sale!, you have recieved a mail regarding the details</h2>
    <h3>Seller name:</h3> <h4> ''' +str(e)+  '''</h4>
    <h3>Land address:</h3>  <h4>''' +str(f)+  ''' </h4>
    <a href="/SellerAddLand"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> ADD ANOTHER LAND </button></a>
    <a href="/sellerloginpage"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> LOG OUT </button></a>
    '''
    a = Amenities.objects.get(Address=Address)
    c = Seller.objects.get(Sname=Sname)
    email=c.Saddress
    res = send_mail("LAND ADDED TO SELLING LIST", "Congratulations!. Your land has been successfully added to selling list of ALMS and your Reference-ID is "+str(a.AmenitiesID)+"     Address:   "+str(a.Address)+"     Soil_type:    "+str(a.Soil_type)+"     water_sources:    "+str(a.water_sources)+"     Land_area:    "+str(a.Land_area)+"     suitable_crop:    "+str(a.suitable_crop)+"     Climate_zone:    "+str(a.weather)+"      protection_type:    "+str(a.protection_type)+"     Amount in ₹:    "+str(a.Amount), "#enter_your_email_here", [email])
    return HttpResponse(str3)

def SellerAddLand(request):
    return render(request,"addLand.html")





#searching done by buyer #WORKS


def Bsearch(request):
     address=request.GET.get('address')
     eve =Amenities.objects.filter(Address__icontains=address)
    
     str1='''
     <title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <div class="w3-container w3-black w3-center header"> 
    
  </div>

  <h2> Matching Land Details:</h2>
    
   </div>
<table class="w3-table-all w3-large">
    <thead>
     <tr class="w3-red">
       
         
         <th>Address</th><td></td>
         <th>Soil_type</th><td></td><td></td>
         <th>water_sources</th><td></td>
         <th>Land_area</th><td></td>
         <th>suitable_crop</th><td></td>
         <th>weather</th><td></td>
         <th>protection_type</th><td></td>
         <th>Amount</th><td></td>
         <th><td>        

    </thead> 
     '''
     for address in eve:
        str1+="<tr><td>"+address.Address+"</td><td><td>"+address.Soil_type+"</td><td><td><td>"+address.water_sources+"</td><td><td>"+str(address.Land_area)+"</td><td><td>"+address.suitable_crop+"</td><td><td>"+address.weather+"</td><td><td>"+address.protection_type+"</td><td><td>"+str(address.Amount)+"</td><tr/>"
        
#        istr += "<tr><td>"+str(event.patient_id) +"</td><td><td>"+str(event.Patient_ward_no)+"</td><td><td><td>"+event.pname +"</td><td><td>"+str(event.patient_age)+"</td><td><td>"+event.Patient_sex +"</td><td><td>"+event.Symtoms +"</td><td><td>"+str(event.patient_phone)+"</td><td><td>"+event.Patient_address +"</td><tr/>"
     print(str1)
     return HttpResponse(str1)

def search(request):
    return render(request,"search.html")


#display to buyer #WORKS

def Bdisplay(request):
    
    list=Amenities.objects.all() 
    str1='''

    <tr class="w3-teal">
    <h2 class="" style="margin-left: 15cm;padding-bottom:0cm; margin-top:-1.7cm; color:#040030"> LAND DETAILS </h2>
    <table class="" style="height: 50%; border-style:double; border-width:10px; margin-left:8cm; padding-bottom:2cm;">
`   <tr>
    <th> Land ID  </th><td> </td>
    <th> Address  </th><td> </td>
    <th> Soil_type  </th><td> </td>
    <th> water_sources  </th><td> </td>
    <th> Land_area  </th><td> </td>
    <th> suitable_crop  </th><td> </td>
    <th> weather  </th><td> </td>
    <th> protection_type  </th><td> </td>
    <th> Amount  </th><td> </td>
    </tr>
   
    </thread>
     '''
    for add in list:        
        str1 += "<tr><td>"+str(add.AmenitiesID)+"</td><td><td>"+add.Address+"</td><td><td>"+add.Soil_type+"</td><td><td>"+add.water_sources+"</td><td><td>"+str(add.Land_area)+"</td><td><td>"+add.suitable_crop+"</td><td><td>"+add.weather+"</td><td><td>"+add.protection_type+"</td><td><td>"+str(add.Amount)+"</td><tr/>"
    print(str1)
    return HttpResponse(str1)


def buyerloginpage(request):
    return render(request,"buyerloginpage.html")

def buyersignuppage(request):
    return render(request,"buyersignuppage.html")

def sellerloginpage(request):
    return render(request,"sellerloginpage.html")

def sellersignuppage(request):
    return render(request,"sellersignuppage.html")

def brokerloginpage(request):
    return render(request,"brokerloginpage.html")
    
def brokersignuppage(request):
    return render(request,"brokersignuppage.html")

#Buyer buying land

def coll(request):
    can = Amenities.objects.all()
    istr = '''
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

        function ord(ono)
        {
            $.get("http://localhost:8000/uorder/",{ono:ono}).done(function(data)
                {
                    $("body").html(data)
                });


        }

    </script>

'''

    cnt = 1
    for ans in can:
        istr += '''

        <div class="grid"  style="padding-top:1.5cm;padding-right:1cm;"  >

        <div class="card" >
            <div class="content" style="">
                <h2 id="catt-name">'''+ans.Address + '''</h2>
                    <p class = "pe" > Area: '''+str(ans.Land_area)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Soil: '''+str(ans.Soil_type)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > water_source: '''+str(ans.water_sources)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > suitable_crops: '''+str(ans.suitable_crop)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > weather: '''+str(ans.weather)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > protection_type: '''+str(ans.protection_type)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Amount: '''+str(ans.Amount)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <button type = "button" class = "btn btn-dark" id = "ordrnow"  onclick = ord('''+str(ans.AmenitiesID)+''')  style="font-size:20px;font-weight:bold; font-family:Arial;"> BUY Now </button>

            </div>
        </div>

        </div>

        '''
        cnt += 1
        if cnt % 10 == 0:
            istr += '''''<div class="grid" ></div>'''''
    return HttpResponse(istr)


def uorder(request):
    Bname = request.COOKIES.get('Bname')
    ono = request.GET.get('ono')
    a = Amenities.objects.filter(AmenitiesID=ono)
    print(a)
    c = Buyer.objects.filter(Bname=Bname)
    a.first().contains.add(c.first())
    # c=Buyer.objects.get(Bname=Bname)
    # email=c.Baddress
    # a=Amenities.objects.get(AmenitiesID=ono)
    # Address=a.Address
    # template = 'orderdetail.html'
    # context = {'ono' : ono,'Address':Address,'Bname':Bname}
    # pdf = render_to_pdf(template, context)
    # email = EmailMessage("Order", "Land brought", "#enter_your_email_here", [email])
    # email.content_subtype = "pdf"
    # email.attach('Land_Brought', pdf, 'application/pdf')
    # res = email.send()
    # return HttpResponse("DONE")
    
   
    e=str(Bname)
    f=str(ono)
    str3='''
    <h2>You just brought a land!</h2>
    <h3>Buyer name:</h3> <h4> ''' +str(e)+  '''</h4>
    <h3>Land ID:</h3>  <h4>''' +str(f)+  ''' </h4>
    <a href="/lands"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> BUY ANOTHER LAND </button></a>
    <a href="/buyerloginpage"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> LOG OUT </button></a>
    '''
    a = Amenities.objects.get(AmenitiesID=ono)
    c = Buyer.objects.get(Bname=Bname)
    email=c.Baddress
    res = send_mail("LAND BROUGHT!", "Congratulations!. You have successfully brought a land from the selling list of ALMS and the land details are---- Reference-ID is "+str(a.AmenitiesID)+"     Address:   "+str(a.Address)+"     Soil_type:    "+str(a.Soil_type)+"     water_sources:    "+str(a.water_sources)+"    Land_area:    "+str(a.Land_area)+"     suitable_crop:    "+str(a.suitable_crop)+"     Climate_zone:    "+str(a.weather)+"      protection_type:    "+str(a.protection_type)+"     Amount in ₹:    "+str(a.Amount), "#enter_your_email_here", [email])
    #The bellow code is used to delete the lands which are brought if removed it can be used to update the agri_containss database
    #
    record = Amenities.objects.get(AmenitiesID = ono)
    record.delete()
    #
    #

    return HttpResponse(str3)
  

 #
   
def lands(request):
    return render(request,"lands.html")


#diaplay all brokers

def bro(request):
    can = Broker.objects.all()
    str1 = '''
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

        function ord(ono)
        {
            $.get("http://localhost:8000/border/",{ono:ono}).done(function(data)
                {
                    $("body").html(data)
                });


        }

    </script>
'''
    cnt = 1
    for ans in can:
        str1 += '''

        <div class="grid"  style="padding-top:1.5cm;padding-right:1cm;"  >

        <div class="card" >
            <div class="content" style="">
                    <p class = "pe" > ID: '''+str(ans.BrokerID)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Name: '''+str(ans.Brname)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Phone: '''+str(ans.Brphone_number)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Email: '''+str(ans.address)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                   
                    <button type = "button" class = "btn btn-dark" id = "ordrnow"  onclick = ord('''+str(ans.BrokerID)+''')  style="font-size:20px;font-weight:bold; font-family:Arial;"> Book Now </button>

            </div>
        </div>

        </div>

        '''
        cnt += 1
        if cnt % 10 == 0:
            str1 += '''''<div class="grid" ></div>'''''
    return HttpResponse(str1)

def border(request):
    Bname = request.COOKIES.get('Bname')

    ono = request.GET.get('ono')
    a = Broker.objects.filter(BrokerID=ono)
    print(a)
    c = Buyer.objects.filter(Bname=Bname)
    a.first().helps.add(c.first())
    # c=Buyer.objects.get(Bname=Bname)
    # email=c.Baddress
    # a=Broker.objects.get(BrokerID=ono)
    # Brphone_number=a.Brphone_number
    # Brname=a.Bname
    # template = 'orderdetail.html'
    # context = {'ono' : ono,'Bname':Bname,'Brname':Brname,'Brphone_number':Brphone_number,}
    # pdf = render_to_pdf(template, context)
    # email = EmailMessage("Order", "Broker Booked", "#enter_your_email_here", [email])
    # email.content_subtype = "pdf"
    # email.attach('Broker_Booked', pdf, 'application/pdf')
    # res = email.send()
    # return HttpResponse("DONE")


    e=str(Bname)
    f=str(ono)
    str3='''
    <h2>You just booked a broker</h2>
    <h3>Buyer name:</h3> <h4> ''' +str(e)+  '''</h4>
    <h3>Broker ID:</h3>  <h4>''' +str(f)+  ''' </h4>
     <a href="/Brokers"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> BACK </button></a>
    <a href="/buyerloginpage"><button type = "button" class = "btn btn-dark" style="font-size:20px;font-weight:bold; font-family:Arial;"> LOG OUT </button></a>
    '''
    a = Broker.objects.get(BrokerID=ono)
    c = Buyer.objects.get(Bname=Bname)
    email=c.Baddress
    res = send_mail("BROKER BOOKED", "Congratulations!. You just booked a broker to help you in buying  your desired land, the details are-----     Broker-ID:    "+str(a.BrokerID)+"     Name:    "+str(a.Brname)+"     Phone number:    "+str(a.Brphone_number)+"     E-mail:    "+str(a.address)+".", "#enter_your_email_here", [email])
    return HttpResponse(str3)




def Brokers(request):
    return render(request,"Brokers.html")




#broker page 
#display to broker which seller booked him
#
#
#
#Might have to delete later
#
#
#
def bropage(request):
    
    Brname=request.COOKIES.get('usname')
    eve =Broker.objects.get(Brname=Brname)
    list=eve.helps.all()
    cnt=1
    str1=""
    for ans in list:
        str1 += '''

        <div class="grid"  style="padding-top:1.5cm;padding-right:1cm;"  >

        <div class="card" >
            <div class="content" style="">
                    <p class = "pe" > ID: '''+str(ans.BuyerID)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Name: '''+str(ans.Bname)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > Phone: '''+str(ans.Bphone_number)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
                    <p class = "pe" > address: '''+str(ans.Baddress)+''' <span style = "color: rgb(0, 0, 0); font-weight: bold;" > </span> </p>
            </div>
        </div>

        </div>

        '''
        cnt += 1
        if cnt % 10 == 0:
            str1 += '''''<div class="grid" ></div>'''''
    return HttpResponse(str1)

def Brokerpage(request):
    return render(request,"Brokerpage.html")
#
#
##
#
#
#
###
#
#
#
#
#
#






#MAIL FORGOT PASSWORD




#Broker change password


def getotpbr(request):
    otp = randint(000000,999999) 
    address=request.GET.get('email') 
    file_exists = os.path.exists('enm.txt')
    ss=''
    if file_exists:
        f = open("enm.txt", "r")
        for fh in f:
            s=fh.split(":")
            em=s[0]
            if em==address:
                continue
            s+=fh
        f.close()        
    f = open("enm.txt", "w")
    ss+=address+":"+str(otp)
    f.write(ss)
    f.close()
    send_mail("OTP", "Your OTP is "+str(otp)+"  .If you don't recognize or expect this email, please don't share the above code with anyone", "#enter_your_email_here", [address])
    return HttpResponse('Mail sent')

#Get change of password html page
def brpass(request):
    return render(request,"brpass.html")

#implementing change of password method
def brchangepass(request):
    address=request.GET.get('email') 
    rotp=request.GET.get('rotp') 
    npsw=request.GET.get('npsw') 
    f = open("enm.txt", "r")
    for fh in f:
        s=fh.split(":")
        em=s[0]
        otp=s[1]
        if em==address and otp==rotp :
                c=Broker.objects.get(address=address)
                npsw=hashlib.md5(npsw.encode('utf-8')).hexdigest()
                c.password=npsw
                c.save()

                return HttpResponse("Password changed successfully, now please go back and login")
    return HttpResponse("OTP invalid")











#Buyer change password


def getotpb(request):
    otp = randint(000000,999999) 
    Baddress=request.GET.get('email') 
    file_exists = os.path.exists('enm.txt')
    ss=''
    if file_exists:
        f = open("enm.txt", "r")
        for fh in f:
            s=fh.split(":")
            em=s[0]
            if em==Baddress:
                continue
            s+=fh
        f.close()        
    f = open("enm.txt", "w")
    ss+=Baddress+":"+str(otp)
    f.write(ss)
    f.close()
    send_mail("OTP", "Your OTP is "+str(otp)+"  .If you don't recognize or expect this email, please don't share the above code with anyone", "#enter_your_email_here", [Baddress])
    return HttpResponse('Mail sent')

#Get change of password html page
def bpass(request):
    return render(request,"bpass.html")

#implementing change of password method
def bchangepass(request):
    Baddress=request.GET.get('email') 
    rotp=request.GET.get('rotp') 
    npsw=request.GET.get('npsw') 
    f = open("enm.txt", "r")
    for fh in f:
        s=fh.split(":")
        em=s[0]
        otp=s[1]
        if em==Baddress and otp==rotp :
                c=Buyer.objects.get(Baddress=Baddress)
                npsw=hashlib.md5(npsw.encode('utf-8')).hexdigest()
                c.password=npsw
                c.save()

                return HttpResponse("Password changed successfully, now please go back and login")
    return HttpResponse("OTP invalid")








#Seller change password


def getotps(request):
    otp = randint(000000,999999) 
    Saddress=request.GET.get('email') 
    file_exists = os.path.exists('enm.txt')
    ss=''
    if file_exists:
        f = open("enm.txt", "r")
        for fh in f:
            s=fh.split(":")
            em=s[0]
            if em==Saddress:
                continue
            s+=fh
        f.close()        
    f = open("enm.txt", "w")
    ss+=Saddress+":"+str(otp)
    f.write(ss)
    f.close()
    send_mail("OTP", "Your OTP is "+str(otp)+"  .If you don't recognize or expect this email, please don't share the above code with anyone", "#enter_your_email_here", [Saddress])
    return HttpResponse('Mail sent')

#Get change of password html page
def spass(request):
    return render(request,"Spass.html")


#implementing change of password method
def schangepass(request):
    Saddress=request.GET.get('email') 
    rotp=request.GET.get('rotp') 
    npsw=request.GET.get('npsw') 
    f = open("enm.txt", "r")
    for fh in f:
        s=fh.split(":")
        em=s[0]
        otp=s[1]
        if em==Saddress and otp==rotp :
                c=Seller.objects.get(Saddress=Saddress)
                npsw=hashlib.md5(npsw.encode('utf-8')).hexdigest()
                c.password=npsw
                c.save()

                return HttpResponse("Password changed successfully, now please go back and login")
    return HttpResponse("OTP invalid")


