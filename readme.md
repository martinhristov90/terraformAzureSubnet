## This reposistory is created with learning purposes for Terraform, focusing on AzureRM provider.

## Purpose :

- It provides a simple example of how to create a resource group and subnet within that resource group using Terraform with AzureRM provider.

## How to install terraform : 

- The information about installing terraform can be found on the HashiCorp website 
[here](https://learn.hashicorp.com/terraform/getting-started/install.html)

## How to use it :

- In a directory of your choice, clone the github repository :
    ```
    git clone https://github.com/martinhristov90/terraformAzureSubnet.git
    ```

- Change into the directory :
    ```
    cd terraformAzureSubnet
    ```

- In order to use `AzureRM` provider, you need to authenticate, there are several methods listed [here](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html).

- Run `terraform plan`, it is going to create a plan of the resources to be created. The output should look like this :

    ```
        Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      + azurerm_resource_group.trainingRG
          id:                              <computed>
          location:                        "westeurope"
          name:                            "trainingRG"
          tags.%:                          "1"
          tags.environment:                "trainingENV"

      + azurerm_virtual_network.trainingNetwork
          id:                              <computed>
          address_space.#:                 "1"
          address_space.0:                 "10.0.0.0/16"
          location:                        "westeurope"
          name:                            "trainingRG-trainingNetwork"
          resource_group_name:             "trainingRG"
          subnet.#:                        "1"
          subnet.489913266.address_prefix: "10.0.1.0/24"
          subnet.489913266.id:             <computed>
          subnet.489913266.name:           "trainingRG-trainingSubnet"
          subnet.489913266.security_group: ""
          tags.%:                          "1"
          tags.environment:                "trainingENV"


    Plan: 2 to add, 0 to change, 0 to destroy.

    ```

- Now you can run `terraform apply` to actually create resources in Azure. Your output should look like this :

    ```
    ---SNIP---
    azurerm_resource_group.trainingRG: Creating...
      location:         "" => "westeurope"
      name:             "" => "trainingRG"
      tags.%:           "" => "1"
      tags.environment: "" => "trainingENV"
    azurerm_resource_group.trainingRG: Creation complete after 1s (ID: /subscriptions/SUBSCRIPTION/resourceGroups/trainingRG)
    azurerm_virtual_network.trainingNetwork: Creating...
      address_space.#:                 "" => "1"
      address_space.0:                 "" => "10.0.0.0/16"
      location:                        "" => "westeurope"
      name:                            "" => "trainingRG-trainingNetwork"
      resource_group_name:             "" => "trainingRG"
      subnet.#:                        "" => "1"
      subnet.489913266.address_prefix: "" => "10.0.1.0/24"
      subnet.489913266.id:             "" => "<computed>"
      subnet.489913266.name:           "" => "trainingRG-trainingSubnet"
      subnet.489913266.security_group: "" => ""
      tags.%:                          "" => "1"
      tags.environment:                "" => "trainingENV"
    azurerm_virtual_network.trainingNetwork: Still creating... (10s elapsed)
    azurerm_virtual_network.trainingNetwork: Creation complete after 11s (ID: /subscriptions/SUBSCRIPTION/trainingRG-trainingNetwork)

    Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
    ---SNIP---
    ```
- You can verify using the web interface of Azure, that virtual network is created within RG named "trainingRG". The easiest way to find the resources is by using the tag they have been given, it is "environment="trainingENV"

- In order to destroy the created resources, you can use `terraform destroy`.