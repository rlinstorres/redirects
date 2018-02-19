# Redirects Cookbook

This cookbook provides a servers Debian/Ubuntu 16.04 or 14.04 with webserver Apache and set ups of the of URL redirects in your structure.

## Cookbooks:

This cookbook has some dependencies.

 - cookbook 'apache2', '~> 5.0.1'

## Chef

 - Chef 12.7+ 

## Platforms:

 - Ubuntu 14.04 and 16.04 

## Dependencies

That dependencies it's gonna be resolved by berkshelf using CHEF supermaket.

Before run this recipe you need run berks for download and install dependencies

```
berks vendor <your_cookbooks_path>
```
 
Chefdk is required.

## Usage

This cookbook set ups redirects of URL in your structure with webserver Apache, just make the recipe include.

```
include_recipe 'redirects'
```

In your data_bags directory is necessary create a directory with the name "redirects", for example and the create a file vhost-example.json and set de ENVIRONMENT of the your structure.

```
{
  "id": "vhost-example",
  "_default": {
    "example.com": {
      "docroot": "/var/www/html",
      "log_level": "warn",
      "server_admin": "email@example.com",
      "server_alias": "www.example.com",
      "redir": [
        "RedirectMatch 301 /(.*) http://other-example.com/"
      ]
    }
  },
  "tag": "redirects"
}
```

 - You need a Public IP or Load Balancer to service these redirects servers.

 - It will be necessary to add or change in your DNS the URL address for 'Type A' Public IP or 'Type CNAME' Load Balancer for the request to be forwarded to the server that will handle the redirect.

## Attributes

Set the data_bag name and tag name, for example:

- `default['redirects']['data_bag']['name']` - Default 'redirects'
- `default['redirects']['data_bag']['tag']` - Default 'redirects'
