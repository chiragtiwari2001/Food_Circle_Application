# FOOD CIRCLE APPLICATION

This is a simple food ordering application built using the Ruby on Rails framework. It allows users to browse a menu, add items to their cart, and place orders.
## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)

## Features

- User authentication and authorization (e.g., Devise gem).
- Browse a list of available food items.
- Add items to a shopping cart.
- Place orders and view order history.
- Admin for managing restaurant, menu items, orders, and users.
- Responsive design for desktop.

## Getting Started

Follow these instructions to set up and run the food ordering application on your local machine.

### Prerequisites

- Ruby (version 3.2.2)
- Ruby on Rails (version 7.0.8 or higher)
- sqlite3 database
- Node.js and Yarn (for managing JavaScript assets)

### Installation

1. Clone git repository to local machine
```bash
git clone https://github.com/chiragtiwari2001/Food_Circle_Application.git
```

2. Install the required gems and javascript packages.
```bash
bundle install
yarn install
```

3. create database and run migration.
```bash
rails db:migrate
```

4. Start rails server.
```bash
rails server
```

5. Open web browser and write 'localhost:3000' in the url to access your application. 

## Usage

1. Register or log in as a user.
2. Browse the menu, add items to your cart.
3. Proceed to checkout and complete the order.
4. As an admin, you can access restaurants, menu items, orders, and users.
