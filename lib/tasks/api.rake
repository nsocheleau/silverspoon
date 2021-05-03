namespace :api do
  desc 'adds en event'
  task :event, [:title, :body] do |t, args|
    uri = URI('http://localhost:3000/api/events')
    res = Net::HTTP.post_form(uri, 'title' => args.title, 'body' => args.body)
    puts res.body
  end
end
