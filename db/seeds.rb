# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@findbobi.com', password: 'findbobi', password_confirmation: 'findbobi')

BusinessType.create(
  [
    { name: "Meetups" },
    { name: "Conferences" },
    { name: "Concert" },
    { name: "Cultural" },
    { name: "Facebook groups" },
    { name: "General Practitioners" },
    { name: "Dermatologist" },
    { name: "Psychotherapist" },
    { name: "Dentist" },
    { name: "Gynecologist" },
    { name: "Urologist" },
    { name: "Lawyer" },
    { name: "Beautician" },
    { name: "Hairdresser" },
    { name: "Tax advisor" },
    { name: "Accountant" },
    { name: "DJs" },
    { name: "Artists" },
    { name: "Delivery/Freight" },
    { name: "Cleaning" },
    { name: "Restaurants" },
    { name: "Grocery Store" },
    { name: "Supermarket" },
    { name: "Bars" },
    { name: "Clubs" },
    { name: "Babysitter" }
  ]
)
