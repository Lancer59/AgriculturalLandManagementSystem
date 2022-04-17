"""main URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from unicodedata import name
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from agri.views import login, loginB, loginS, Bsearch,search, uloginB, uloginS


from agri.views import layout


from agri.views import home
from agri.views import contact
from agri.views import SellerAddLand
from agri.views import brokerloginpage
from agri.views import brokersignuppage
from agri.views import sellersignuppage
from agri.views import sellerloginpage
from agri.views import buyerloginpage
from agri.views import buyersignuppage
from agri.views import ulogin

from agri.views import ureg
from agri.views import uregB

from agri.views import uregS

from agri.views import SaddS

from agri.views import Bdisplay
#order land 
from agri.views import lands
from agri.views import uorder
from agri.views import coll
#order broker
from agri.views import bro
from agri.views import border
from agri.views import Brokers
from agri.views import Brokerpage
from agri.views import bropage

from agri.views import Sadd


from django.contrib.staticfiles.urls import staticfiles_urlpatterns


from agri.views import getotpbr,brpass,brchangepass
from agri.views import getotpb,bpass,bchangepass
from agri.views import getotps,spass,schangepass
urlpatterns = [
    path("admin/", admin.site.urls),
    path("layout/", layout),


    path("home/", home),
    path("contact/", contact),
    path("SellerAddLand/", SellerAddLand),

   
    path('',home),
    path("sellerloginpage/", sellerloginpage ),
    path("sellersignuppage/", sellersignuppage),
    path("buyerloginpage/", buyerloginpage),
    path("buyersignuppage/", buyersignuppage),
    path("brokerloginpage/", brokerloginpage),
    path("brokersignuppage/", brokersignuppage),

    # Login of broker,buyer,seller in order
    path("ulogin/", ulogin),
    path("login/", login),
    path("uloginB/", uloginB),
    path("login/", loginB),
    path("uloginS/", uloginS),
    path("login/", loginS),
    # signup of broker,buyer,selles in order

    path("ureg/", ureg),
    path("uregB/", uregB),

    path("uregS/", uregS),


#original Functionality
    path("SaddS/",SaddS),


#Searching 
    path("search/",search),
    path("Bsearch/",Bsearch),

#DISPLAY IN  BUYER
    path("Bdisplay/",Bdisplay),

#Ordering land
    path("lands/",lands),
    path('coll/', coll),
    path('uorder/', uorder),

#ordering brokers

    path("bro/",bro),
    path('border/', border),
    path('Brokers/', Brokers),

#Broker page (which seller booked him)
    path("bropage/",bropage),
    path("Brokerpage/",Brokerpage),
#seller link with land
    path("Sadd/",Sadd),
#Mail
    path('getotpbr/',getotpbr),
    path('brpass/',brpass),
    path('changepass/',brchangepass),

    path('getotpb/',getotpb),
    path('bpass/',bpass),
    path('bchangepass/',bchangepass),


    path('getotps/',getotps),
    path('spass/',spass),
    path('schangepass/',schangepass),

]

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
