# #COUNT
# resource "azurerm_resource_group" "rg0" { 
#     count =3 
#     name = "satya-rg"
#   location = "central india"
# }

# #COUNT & count.index
# resource "azurerm_resource_group" "rg0" { 
#     count =3       #create 3 rgs
#     name = count.index      #0 ,1 ,2
#   location = "central india"
# }

#COUNT & count.index & interpolation ${s}
#interpolation ${s} example
# satya${prakash}  satyaprakash
# satya-${prakash}  satya-prakash
#satya- + prakash   satya-prakash


# resource "azurerm_resource_group" "rg0" { 
#     count =3       #create 3 rgs
#     name = "satya-rg${count.index}"  # "satya-rg0", "satya-rg1","satya-rg2"
#   location = "central india"
# }


# #COUNT & count.index & interpolation ${s} & variable & list
# resource "azurerm_resource_group" "rg0" { 
#     count =5      #create 3 rgs
#     name =  var.name[count.index]                         #"satya-rg${count.index}"  
#   location = "central india"
# }
# variable "name" {}

# #COUNT & count.index & interpolation ${s} & variable & length
# resource "azurerm_resource_group" "rg0" { 
#     count = length(var.name)         #count =5 
#     name =  var.name[count.index]                         #"satya-rg${count.index}"  
#   location = "central india"
# }
variable "name" {}

#COUNT & count.index & interpolation ${s} & variable & length
resource "azurerm_resource_group" "rg1" { 
    # count = length(var.name)         #count =5 
    name =  var.name[0]                         #"satya-rg${count.index}"  
  location = "central india"
}
# variable "name" {}
