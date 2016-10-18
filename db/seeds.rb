# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

JobType.create([
                 { id:1, name:'電話対応' },
                 { id:2, name:'トラブル対応' },
                 { id:3, name:'コーディング' },
                 { id:4, name:'SI' }
               ])

Customer.create([
                  { id:1, short_name:'NTT中日本' },
                  { id:2, short_name:'JR中日本' }
                ])

# Job.create([
#              { id:1, job_type_id:4, title: 'Test', detail: 'Test', begin_date: Time.now, end_date: Time.now + 600, place: 'here', worktime: 600, customer_id: 1}
#            ])
