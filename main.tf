provider "azurerm"{
    version = "2.5.0"
    features {

    }

    
}

resource "azurerm_resource_group" "tf_test"{
    name = "tfmainrg"
    location = "Centralus"
}

resource "azurerm_container_group" "tfcg_test"{
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "terraformbarrier"
    os_type = "Linux"

    container {
      name = "weatherapi"
      image = "dmwilliams928/weatherapi"
      cpu = "1"
      memory = "1"

      ports{
          port = 80
          protocol = "TCP"
      }
    }
}