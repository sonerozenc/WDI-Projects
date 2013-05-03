User.destroy_all

users = User.create([
  { :name => 'Soner Ozenc', :email => 'sonerozenc@gmail.com', :address => '24 St Francis Rd, SE22 8DE, London, UK', :phone => '+44 779 287 00 07', :website => 'sonerozenc.com', :is_designer => 'true', :password => '123', :password_confirmation => '123' },
  { :name => 'John Smith', :email => 'john@gmail.com', :address => '456 st, New York, USA', :phone => '+1 123 123 45 67', :website => 'john.com', :is_designer => 'true', :password => '123', :password_confirmation => '123' },
  { :name => 'Jack Ruby', :email => 'jack@gmail.com', :address => '123 st, Istanbul, Turkey', :phone => '+90 123 123 45 67', :website => 'jack.com', :is_designer => 'true', :password => '123', :password_confirmation => '123' },
  { :name => 'Hans Muller', :email => 'hans@gmail.com', :address => 'Berlin, Germany', :phone => '+45 123 123 45 67', :website => 'hans.com', :is_designer => 'false', :password => '123', :password_confirmation => '123' },
  { :name => 'Pierre Amelie', :email => 'pierre@gmail.com', :address => 'Paris, France', :phone => '+34 123 123 45 67', :website => 'pierre.com', :is_designer => 'false', :password => '123', :password_confirmation => '123' },
  { :name => 'Derek Elton', :email => 'derek@gmail.com', :address => 'Wellington, New Zeland', :phone => '+11 123 123 45 67', :website => 'derek.com', :is_designer => 'false', :password => '123', :password_confirmation => '123' }
])

services = Service.create([
  { :title => 'Hans Individual Hub', :type_of_service => 'Individual Hub', :printer_model => 'Makerbot', :address => 'Berlin, Germany', :phone => '+44 123 123 45 67', :website => 'hans3dhub.com', :user => users[3] },
  { :title => 'Pierre Design Bureau', :type_of_service => 'Design Bureau', :printer_model => 'Form1', :address => '123 st, Amsterdam, Netherlands', :phone => '+44 123 123 45 67', :website => 'pierrebureau.com', :user => users[4] },
  { :title => 'Ponoko Online Service', :type_of_service => 'Online Service', :printer_model => 'Upverter', :address => 'San Francisco, USA', :phone => '+1 123 123 45 67', :website => 'ponoko.com', :user => users[5] }
])

# jobs = Job.create([
#   { :title => 'Coin Mirror', :cad_file => File.open(File.join(Rails.root, 'db', 'fixtures', 'Octave_Spool_Clip_v3-1.STL')), :material => 'metal', :is_private => false, :order_status => 'pending', :user => users[0], :service => services[0] },
#   { :title => 'Flag Mirror', :cad_file => File.open(File.join(Rails.root, 'db', 'fixtures', 'Octave_Spool_Clip_v3-1.STL')), :material => 'glass', :is_private => false, :order_status => 'pending', :user => users[1], :service => services[2] },
#   { :title => 'Stamp Mirror', :cad_file => File.open(File.join(Rails.root, 'db', 'fixtures', 'Octave_Spool_Clip_v3-1.STL')), :material => 'plastic', :is_private => true, :order_status => 'accepted', :user => users[2], :service => services[0] },
#   { :title => 'Tetris Mirror', :cad_file => File.open(File.join(Rails.root, 'db', 'fixtures', 'Octave_Spool_Clip_v3-1.STL')), :material => 'plastic', :is_private => false, :order_status => 'accepted', :user => users[0], :service => services[1] },
#   { :title => 'Cursor Mirror', :cad_file => File.open(File.join(Rails.root, 'db', 'fixtures', 'Octave_Spool_Clip_v3-1.STL')), :material => 'metal', :is_private => true, :order_status => 'completed', :user => users[1], :service => services[2] }
# ])

jobs = Job.create([
  { :title => 'Coin Mirror', :material => 'metal', :is_private => false, :order_status => 'pending', :user => users[0], :service => services[0] },
])

# images = Image.create([
#   { :caption => 'Coin Mirror 1', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'coin_mirror_1.jpg')), :user => users[0], :job => jobs[0] },
#   { :caption => 'Coin Mirror 2', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'coin_mirror_2.jpg')), :user => users[1], :job => jobs[0] },
#   { :caption => 'Flag Mirror 1', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'flag_mirror_1.jpg')), :user => users[2], :job => jobs[1] },
#   { :caption => 'Flag Mirror 2', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'flag_mirror_2.jpg')), :user => users[0], :job => jobs[1] },
#   { :caption => 'Stamp Mirror 1', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'stamp_mirror_1.jpg')), :user => users[1], :job => jobs[2] },
#   { :caption => 'Stamp Mirror 2', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'stamp_mirror_2.jpg')), :user => users[1], :job => jobs[2] },
#   { :caption => 'Stamp Mirror 3', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'stamp_mirror_3.jpg')), :user => users[1], :job => jobs[2] },
#   { :caption => 'Stamp Mirror 4', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'stamp_mirror_4.jpg')), :user => users[1], :job => jobs[2] },
#   { :caption => 'Tetris Mirror 1', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'tetris_mirror_1.jpg')), :user => users[2], :job => jobs[3] },
#   { :caption => 'Tetris Mirror 2', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'tetris_mirror_2.jpg')), :user => users[2], :job => jobs[3] },
#   { :caption => 'Cursor Mirror 1', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'cursor_mirror_1.jpg')), :user => users[2], :job => jobs[4] },
#   { :caption => 'Cursor Mirror 2', :file => File.open(File.join(Rails.root, 'db', 'fixtures', 'cursor_mirror_2.jpg')), :user => users[2], :job => jobs[4] },
# ])

comments = Comment.create([
  { :subject => 'Brilliant', :message => 'This is a brilliant design.', :user => users[2], :job => jobs[0] },
  { :subject => 'Not brilliant', :message => 'This is not a brilliant design.', :user => users[0], :job => jobs[1] },
  { :subject => 'Worst', :message => 'This is the worst design.', :user => users[1], :job => jobs[2] },
  { :subject => 'Hate', :message => 'I hate this one.', :user => users[1], :job => jobs[3] },
  { :subject => 'Love', :message => 'I love it, well done.', :user => users[2], :job => jobs[4] },
  { :subject => 'Not sure', :message => 'I m not sure about this design.', :user => users[0], :job => jobs[3] },
  { :subject => 'Fantastichen', :message => 'Wov, fantastic!!!', :user => users[1], :job => jobs[4] },
])

# sketchfabs = Sketchfab.create([
#   { :html => '<iframe frameborder="0" height="480" width="854" allowFullScreen webkitallowfullscreen="true" mozallowfullscreen="true" src="http://skfb.ly/5l4jihgfda?autostart=0&transparent=0&autospin=0&controls=1"></iframe>', :job => [0]}
# ])