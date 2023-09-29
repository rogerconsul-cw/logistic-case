# Ruby on Rails Bookstore Application

## Introduction

📘 This Ruby on Rails application is a simple CRUD (Create, Read, Update, Delete) demonstration of books and authors. It allows you to manage books and authors, view their details, and perform searches. 

## Requirements

📋 Before running this application, ensure you have the following prerequisites installed:

- Ruby (>= 2.5.0)
- Rails (>= 5.2.0)
- PostgreSQL Database (>= 9.4.0)
- Bundler Gem (`gem install bundler`)

## Setup

🛠️ Follow these steps to set up and run the application:

1. Clone the repository:
```git clone git@github.com:rogerconsul-cw/logistic-case.git```


2. Navigate to the project directory:
```cd log-case```

3. Install gem dependencies using Bundler:
```bundle install```

4. Create the database and run migrations:
```rails db:create```
```rails db:migrate```

5. (Optional) Seed the database with sample data:
```rails db:seed```

## Usage

- 🚀 To start the Rails server, run:


- 🌐 Access the application in your web browser at `http://localhost:3000/`.

## Functionality

📚 **Books**: 
- Create, Read, Update, Delete books.
- Associate books with authors.

👨‍👩‍👦‍👦 **Authors**: 
- Create, Read, Update, Delete authors.
- View books associated with authors.

🔗 **Relationships**:
- Each book belongs to one author.
- An author can have multiple books.

📖 **Author-Book Association**:
- When creating a book, if the author is not found, a new author is automatically created.

🔍 **Search Bar**:
- The application features a working search bar to search for books and authors.

🚫 **Author Dependency**:
- You cannot remove an author if there are books associated with them. Remove books first.

## Contributing

Feel free to contribute to this project by submitting issues or pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
