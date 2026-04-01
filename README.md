# Ruby on Rails Image Demo Project

This project is part of the application process at Pictrs GmbH.
See [Task.pdf](Task.pdf) for the full description.

The application enables users to upload pictures. Each picture is then processed and displayed in two variants: a 
smaller version and a grayscale version. For the latter, a histogram is also displayed.

## Tech Stack
- Ruby (4.0.2)
- Rails (8.1.2.1)

## Prerequisites
Ensure the following are installed:
- Ruby
- Rails
- Bundler
- [libvips](https://github.com/libvips/libvips?tab=readme-ov-file) (for image processing)

## Setup Instructions

### 1. Clone the Repository
```
git clone https://github.com/maxfornacon/rails_image_demo.git
cd rails_image_demo
```

### 2. Install Dependencies
```
bundle install
```

### 3. Setup Database
```
rails db:create
rails db:migrate
```

### 4. Start the Server
```
rails server
```

After that visit: `http://localhost:3000`

## Running Tests
```
rails test
```