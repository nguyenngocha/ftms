namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating Role"
    ["admin", "trainer"].each do |name|
      Fabricate :role, name: name, allow_access_admin: true
    end
    Fabricate :role, name: "trainee", allow_access_admin: false

    puts "Creating User"
    User.create!([
      {name: "Nguyen Binh Dieu", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen_Binh_Dieu.jpg")),
        email: "admin@tms.com", password: "12345678",
        password_confirmation: "12345678"}])

    puts "Create User Roles"
    User.all.each do |user|
      user.user_roles.create!([{role_id: 1, user: user}])
      user.user_roles.create!([{role_id: 2, user: user}])
      user.user_roles.create!([{role_id: 3, user: user}])
    end
    # puts "Creating User"
    # User.create!([
    #   {name: "Nguyen Binh Dieu", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Nguyen_Binh_Dieu.jpg")), role_id: 1,
    #     email: "admin@tms.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Mai Tuan Viet", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Mai Tuan Viet.jpg")), role_id: 2,
    #     email: "supervisor@tms.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Truong Loc Binh", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Truong Loc Binh.jpg")), role_id: 3,
    #     email: "truonglocbinh@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Vu Duc Luan", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Vu Duc Luan.jpg")), role_id: 3,
    #     email: "vuducluan@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Ngo Van Thien ", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Ngo Van Thien.jpg")), role_id: 3,
    #     email: "ngovanthie@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Ngo Van Duong", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Ngo Van Duong.jpg")), role_id: 3,
    #     email: "ngovanduong@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Nguyen Thai Son", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Nguyen Thai Son.jpg")), role_id: 3,
    #     email: "nguyenthaison@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Mai Dinh Phu ", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Mai Dinh Phu.jpg")), role_id: 3,
    #     email: "maidinhphu@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Nguyen Van Hien", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Nguyen Van Hien.jpg")), role_id: 3,
    #     email: "nguyenvanhien@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Nguyen Thi Trang", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Nguyen Thi Trang.png")), role_id: 3,
    #     email: "nguyenthitrang@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Nguyen Thi Mo", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Nguyen Thi Mo.jpg")), role_id: 3,
    #     email: "nguyenthimo@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Hoang Van Nam", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Hoang Van Nam.jpg")), role_id: 3,
    #     email: "hoangvannam@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Du Thanh Hai", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Bui Quoc Viet.jpg")), role_id: 3,
    #     email: "duthanhhai@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Mai Dinh Phi", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Nguyen Tuan Trong.jpg")), role_id: 3,
    #     email: "maidinhphi@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Hoang Thi Linh", avatar: File.open(File.join(Rails.root,
    #     "app/assets/images/user/Hoang Thi Linh.jpg")), role_id: 3,
    #     email: "hoangthilinh@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Dinh Hoang Hai", avatar: nil, role_id: 3,
    #     email: "dinhhoanghai@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Nguyen Sinh", avatar: nil, role_id: 3,
    #     email: "nguyensinh@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Nguyen Tuan Trong", avatar: nil, role_id: 3,
    #     email: "nguyentuantrong@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Hoang Linh", avatar: nil, role_id: 3,
    #     email: "hoanglinh@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Truong Thi Thao", avatar: nil, role_id: 3,
    #     email: "truongthithao@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Can Van Nghi", avatar: nil, role_id: 3,
    #     email: "canvannghi@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Luu Binh", avatar: nil, role_id: 3,
    #     email: "luubinh@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Duong Phuong", avatar: nil, role_id: 3,
    #     email: "duongphuong@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Ha Linh", avatar: nil, role_id: 3,
    #     email: "halinh@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Ly Hoang Nam", avatar: nil, role_id: 3,
    #     email: "lyhoangnam@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Mai Thao", avatar: nil, role_id: 3,
    #     email: "maithao@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Dinh Phuong Linh", avatar: nil, role_id: 3,
    #     email: "dinhphuonglinh@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Minh Phuong", avatar: nil, role_id: 3,
    #     email: "minhphuong@gmail.com", password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "So khen", avatar: nil, role_id: 3,
    #     email: "sokhen@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Chenkim", avatar: nil, role_id: 3,
    #     email: "chenkim@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"},
    #   {name: "Kooru", avatar: nil, role_id: 3,
    #     email: "kooru@gmail.com",  password: "12345678",
    #     password_confirmation: "12345678"}
    # ])

    puts "Creating Evaluation Template"
    ["Working days", "Number of task",
      "Implement with new techniques", "Git", "Rails basic",
      "Rails advance", "Coding convention", "Plus"].each do |name|
      Fabricate :evaluation_template, name: name
    end

    puts "Creating Permissions"
    ["Course", "CourseSubject", "Subject", "UserSubject"].each do |name|
      Fabricate :permission, model_class: name, action: "manage", role_id: 2
    end
    ["Course", "CourseSubject", "UserCourse", "Subject", "UserSubject", "Task",
      "UserTask", "User"].each do |name|
      Fabricate :permission, model_class: name, action: "read", role_id: 3
    end
    Fabricate :permission, model_class: "Task", action: "create"
    ["UserTask", "User", "Task"].each do |name|
      Fabricate :permission, model_class: name, action: "update", role_id: 3
    end

    puts "Create Rank"
    5.times do
      Fabricate :rank
    end

    puts "Create Universities"
    ["Vietnam National University, Hanoi", "Hanoi University of Science and Technology",
      "Foreign Trade University", "Hanoi University of Industry"].each do |name|
      Fabricate :university, name: name
    end

    puts "Create Programming Languages"
    ["Ruby", "PHP", "Android", "Java", "C"].each do |name|
      Fabricate :programming_language, name: name
    end

    puts "Create User Types"
    ["Intern", "VPG", "JPG", "New dev", "Tester"].each do |name|
      Fabricate :user_type, name: name
    end

    puts "Create Status"
    ["Inprogress", "Finish", "Prepare project", "Jointed project"].each do |name|
      Fabricate :status, name: name
    end

    puts "Create Subject"
    Subject.create!([
      {name: "Try Ruby", image: File.open(File.join(Rails.root,
        "app/assets/images/subject/try-ruby.png")),
        description: "Learn the basic building blocks of Ruby, all in the browser.\r\n",
        content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp;
          Learn about conversions, arrays, variables, and more methods</p>\r\n", during_time: 12},
      {name: "Rails for Zombies Redux", image: File.open(File.join(Rails.root,
        "app/assets/images/subject/Rails-2.png")),
        description: "Learn Ruby on Rails, an open-source framework for the Ruby programming language.
          Rails for Zombies will teach you all the Rails basics with a zombie flair.\r\n",
        content: "<p>Learn more Rails with this sequel to the infamous Rails for Zombies course.
          Increase your Ruby on Rails knowledge with even more zombie learning.</p>\r\n", during_time: 12},
      {name: "Try Git ", image: File.open(File.join(Rails.root,
        "app/assets/images/subject/try-git.png")),
        description: "Learn how to use Git by reviewing the basic concepts of Git
          version control. Try out this introductory course that was created with GitHub.\r\n",
        content: "<pre>\r\n[Git]\r\n<a href=\"http://git-scm.com/book\" target=\"_blank\"
          title=\"http://git-scm.com/book\">http://git-scm.com/book</a>\r\n<a href=\"https://docs.google.com/presentation/d/17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c/edit?usp=sharing\" target=\"_blank\"
          title=\"https://docs.google.com/presentation/d/17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c/edit?usp=sharing\">https://docs.google.com/presentation/d/17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c/edit?usp=sharing</a>
          <a data-content-id=\"-\" data-type=\"googledocs\" data-url=\"https%3A%2F%2Fdocs.google.com%2Fpresentation%2Fd%2F17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c%2Fedit%3Fusp%3Dsharing\" data-user-id=\"\">Preview</a>\r\n\r\n</pre>\r\n",
        during_time: 10}
    ])

    puts "Create Task Master"
    TaskMaster.create!([
      {name: "Get an introduction to numbers, Strings, properties, and methods",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Learn about conversions, arrays, variables, and more methods.",
        description: "Learn about conversions, arrays, variables, and more methods.",
        subject_id: 1},
      {name: "Installing Rails, creating a Rails app, database migrations",
        description: "Installing Rails, creating a Rails app, database migrations, the command line, Ruby 1.9 hash syntax, Bundler, database configuration\r\n",
        subject_id: 2},
      {name: "Named scopes, callbacks, has_one, relationship options, using Includes, has_many :through",
        description: "Named scopes, callbacks, has_one, relationship options, using Includes, has_many :through",
        subject_id: 2},
      {name: "Discover Git",
        description: "Discover Git in Framgia with Chu Anh Tuan trainer",
        subject_id: 3}
    ])

    puts "Create Course"
    Course.create!([
      {name: "Ruby on Rails",
        image: File.open(File.join(Rails.root, "app/assets/images/course/Rails-1.png")),
        description: "Master your Ruby skills and increase your Rails street cred by learning to build dynamic, sustainable applications for the web.\r\n",
        status: 1, programming_language_id: 1, start_date: Time.now + 2.days, end_date: Time.now + 10.days},
      {name: "Git Framgia",
        image: File.open(File.join(Rails.root, "app/assets/images/course/git.png")),
        description: "Git is the most popular version control system that developers use to track and share code.\r\n",
        status: 0, programming_language_id: 1, start_date: Time.now + 1.day, end_date: Time.now + 3.days}
    ])

    # puts "Create Course Subject"
    # CourseSubject.create!([
    #   {subject_name: "Try Ruby",
    #     subject_description: "Learn the basic building blocks of Ruby, all in the browser.\r\n",
    #     subject_content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp;Learn about conversions, arrays, variables, and more methods</p>\r\n",
    #     image: File.open(File.join(Rails.root, "app/assets/images/subject/try-ruby.png")),
    #     subject_id: 1, course_id: 1},
    #   {subject_name: "Rails for Zombies Redux",
    #     subject_description: "Learn Ruby on Rails, an open-source framework for the Ruby programming language. Rails for Zombies will teach you all the Rails basics with a zombie flair.\r\n",
    #     subject_content: "<p>Learn more Rails with this sequel to the infamous Rails for Zombies course. Increase your Ruby on Rails knowledge with even more zombie learning.</p>\r\n",
    #     image: File.open(File.join(Rails.root, "app/assets/images/subject/Rails-2.png")),
    #     subject_id: 2, course_id: 1},
    #   {subject_name: "Try Git ",
    #     subject_description: "Learn how to use Git by reviewing the basic concepts of Git version control. Try out this introductory course that was created with GitHub.\r\n",
    #     subject_content: "<pre>\r\n[Git]\r\n<a href=\"http://git-scm.com/book\" target=\"_blank\" title=\"http://git-scm.com/book\">http://git-scm.com/book</a>\r\n<a href=\"https://docs.google.com/presentation/d/17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c/edit?usp=sharing\" target=\"_blank\" title=\"https://docs.google.com/presentation/d/17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c/edit?usp=sharing\">https://docs.google.com/presentation/d/17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c/edit?usp=sharing</a> <a data-content-id=\"-\" data-type=\"googledocs\" data-url=\"https%3A%2F%2Fdocs.google.com%2Fpresentation%2Fd%2F17ujkZPZbHlku1O5p7vJcUpTKM_ppxFvK9bSF2DRF8_c%2Fedit%3Fusp%3Dsharing\" data-user-id=\"\">Preview</a>\r\n\r\n</pre>\r\n",
    #     image: File.open(File.join(Rails.root, "app/assets/images/subject/try-git.png")),
    #     subject_id: 3, course_id: 2}
    # ])

    # puts "Creating UserCourse"
    # UserCourse.create!([
    #   {active: true, user_id: 1, course_id: 1}
      # {active: true, user_id: 2, course_id: 1},
      # {active: true, user_id: 3, course_id: 1},
      # {active: true, user_id: 4, course_id: 1},
      # {active: true, user_id: 5, course_id: 1},
      # {active: true, user_id: 6, course_id: 1},
      # {active: true, user_id: 7, course_id: 1},
      # {active: true, user_id: 8, course_id: 1},
      # {active: true, user_id: 9, course_id: 1},
      # {active: true, user_id: 10, course_id: 1},
      # {active: true, user_id: 11, course_id: 1},
      # {active: true, user_id: 12, course_id: 1},
      # {active: true, user_id: 13, course_id: 1},
      # {active: false, user_id: 2, course_id: 2},
      # {active: false, user_id: 14, course_id: 2},
      # {active: false, user_id: 15, course_id: 2}
    # ])

    puts "create Activity"
    PublicActivity::ORM::ActiveRecord::Activity.create!([
      {trackable_id: 1, trackable_type: "Course", owner_id: 1,
        owner_type: "User",
        key: "course.start_course", parameters: {},
        recipient_id: nil, recipient_type: nil}
    ])

    puts "Document"
    Document.create!([
      {name: "Ruby Books", content: "Rails.AntiPatterns.pdf",
        documentable_id: 1, documentable_type: "Subject"},
      {name: "Rails advance", content: "Rails.AntiPatterns.pdf",
        documentable_id: 2, documentable_type: "Subject"},
      {name: "Ruby + Git ", content: "Doan_task.odt",
        documentable_id: 1, documentable_type: "Course"},
      {name: "Git book", content: "Pro_git", documentable_id: 3,
        documentable_type: "Subject"},
      {name: "Git book ", content: "Pro_git", documentable_id: 2,
        documentable_type: "Course"}
    ])

    # puts "Profile"
    # Profile.create!([
    #   {user_id: 3, ready_for_project: false,
    #     programming_language_id: 1, status_id: 1},
    #   {user_id: 4, ready_for_project: false,
    #     programming_language_id: 1, status_id: 1},
    #   {user_id: 5, ready_for_project: false, user_type_id: 1,
    #     university_id: 1, programming_language_id: 2, status_id: 3}
    # ])
  end
end
