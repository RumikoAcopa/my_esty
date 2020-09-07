#Here is where I will create some seed data to work w/and test associations
kira = User.create(name: "Rumiko", email: "Rumiko@Rumi.com", password: "password")

#create an account
#use AR to pre-associate data
kira.account.create(birthdate: "August 30, 2005")