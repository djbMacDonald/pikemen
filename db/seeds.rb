Report.delete_all
Agency.delete_all
User.delete_all

user1 = User.create!(email:'q@q.com', username: 'Sparrow', password:'password')
user2 = User.create!(email:'a@a.com', username: 'LaserLemon', password:'password')
user3 = User.create!(email:'b@b.com', username: 'LogLady', password:'password')

agent1 = Agency.create!(name: 'FBI', jurisdiction: 'Federal')
agent2 = Agency.create!(name: 'Massachusetts State Police', jurisdiction: 'State')
agent3 = Agency.create!(name: 'New York Police Department', jurisdiction: 'City')

Report.create!(name:'John Smith', state:'Ney York', city:'New York', incident_date:'2001-03-01', verified: true, agency_id: agent1.id, user_id: user1.id)
Report.create!(name:'Wil Davis-Johnson', state:'New York', city:'New York', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user2.id)
Report.create!(name:'Mary El', state:'New York', city:'New York', incident_date:'2001-03-03', verified: true, agency_id: agent3.id, user_id: user2.id)
Report.create!(name:'Michael Hutchins', state:'New York', city:'New York', incident_date:'2001-03-04', verified: false)
Report.create!(name:'Herbert Sawyer', state:'New York', city:'New York', incident_date:'2001-03-05', verified: false)
Report.create!(name:'Teresa Barger', state:'New York', city:'New York', incident_date:'2001-03-06', verified: true, agency_id: agent1.id, user_id: user3.id)
Report.create!(name:'Lee DeVito', state:'New York', city:'New York', incident_date:'2001-03-07', verified: true, agency_id: agent3.id, user_id: user3.id)
Report.create!(name:'Jesse Kelly', state:'New York', city:'New York', incident_date:'2001-03-08', verified: true, agency_id: agent3.id, user_id: user3.id)
Report.create!(name:'Lon Brown', state:'New York', city:'New York', incident_date:'2001-03-09', verified: true, agency_id: agent1.id, user_id: user1.id)
Report.create!(name:'Erika Johns', state:'Massachusetts', city:'Boston', incident_date:'2001-03-10', verified: true, agency_id: agent2.id, user_id: user2.id)
Report.create!(name:'Natasha Lee Jones', state:'Massachusetts', city:'Boston', incident_date:'2001-03-11', verified: true, agency_id: agent2.id, user_id: user2.id)
Report.create!(name:'Saun Pervis', state:'Massachusetts', city:'Boston', incident_date:'2001-03-12', verified: true, agency_id: agent1.id, user_id: user3.id)
Report.create!(name:'George Rosenstein', state:'Massachusetts', city:'Boston', incident_date:'2001-03-13', verified: true, agency_id: agent2.id, user_id: user3.id)
Report.create!(name:'Al McDonald', state:'California', city:'San Franciso', incident_date:'2001-03-14', verified: true, agency_id: agent1.id, user_id: user3.id)
Report.create!(name:'Ann Reyonlds', state:'California', city:'San Franciso', incident_date:'2001-03-15', verified: true, agency_id: agent1.id, user_id: user1.id)
Report.create!(name:'George Washburn', state:'California', city:'San Franciso', incident_date:'2001-03-16', verified: true, agency_id: agent1.id, user_id: user2.id)
Report.create!(name:'Peter Bright, Jr.', state:'Massachusetts', city:'Boston', incident_date:'2001-03-17', verified: true, agency_id: agent2.id, user_id: user2.id)
Report.create!(name:'Mohammed Al-Sisi', state:'Massachusetts', city:'Boston', incident_date:'2001-03-18', verified: true, agency_id: agent2.id, user_id: user3.id)
Report.create!(name:'Dan Driggers', state:'Massachusetts', city:'Boston', incident_date:'2001-03-19', verified: true, agency_id: agent2.id, user_id: user3.id)
Report.create!(name:'Richard Mayer', state:'Massachusetts', city:'Boston', incident_date:'2001-03-20', verified: true, agency_id: agent2.id, user_id: user3.id)
Report.create!(name:'Dewayne Walker', state:'Massachusetts', city:'Boston', incident_date:'2001-03-21', verified: true, agency_id: agent2.id, user_id: user1.id)
Report.create!(name:'Jose Hermznez', state:'New York', city:'Albany', incident_date:'2001-03-22', verified: true, agency_id: agent3.id, user_id: user2.id)
Report.create!(name:'Quincy Sowell', state:'New York', city:'Albany', incident_date:'2001-03-23', verified: true, agency_id: agent3.id, user_id: user2.id)
Report.create!(name:'Jimmy Simpson', state:'New York', city:'Albany', incident_date:'2001-03-24', verified: true, agency_id: agent3.id, user_id: user3.id)
Report.create!(name:'Sampson Vanderwall', state:'New York', city:'New York', incident_date:'2001-03-05', verified: false)
Report.create!(name:'Jeffery Hoss', state:'New York', city:'New York', incident_date:'2001-03-05', verified: false)
Report.create!(name:'Charles Foreman', state:'New York', city:'New York', incident_date:'2001-03-05', verified: false)
Report.create!(name:'Brian Womack', state:'New York', city:'New York', incident_date:'2001-03-05', verified: false)
