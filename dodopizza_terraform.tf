terraform {
    required_providers {
        dodopizza   = {
            source  = "dodopizza/" #else create terraform dodopizza
            version = "->1.0"
        }
    }
}

provider "dodopizza" {
    fist_name    = ""
    last_name    = ""
    email_addres = ""
    phone_number = ""
}

data "dodopizza" "myaddress" {
    street = ""
    city   = ""
    state  = ""
    zip    = ""
}

data "dodopizza" "closest"{
    address_url_object = data.dodopizza.url_object
}

data "dodopizza_menu_item" "item"{
    store_id     = data.dodopizza_store.closest.store_id
    query_string = ["pizza"]
}

resource "dodopizza_order" "myorder"{
    address_api_object = data.dodopizza.url_object_id
    store_id           = data.dodopizza.closest.story_id
    item_codes         = ["",""]
}



--------------------------------
output "dodopizza_address" {
    value = data.dodopizza.url_object
}
output "dodopizza_store" {
    value = data.dodopizza.closest.story_id
}
output "dodopizz_menu"{
    value = data.dodopizza_menu_item.item
}

output "dodopizza_order"{
    value = dodopizza_order.myorder
}
