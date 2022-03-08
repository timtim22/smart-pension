
def get_list(file)
  new_array = []
  most_views_array = []
  unique_views_array = []
  get_unique = []
  File.open(file, "r") do |f|
    f.each_line do |line|
      new_array << line.split
    end
    
    new_array.each do |i|
      most_views_array << "#{i.first}" + " " + "#{new_array.flatten(1).count(i.first)}" + " visits"
      unique_views_array << "#{i.first}" + " " + "#{new_array.flatten(1).count(i.last)} "
    end
  end
  
  unique_views_array.uniq.each do |i|
    get_unique << "#{i.split.first}" + " " + "#{unique_views_array.uniq.join.split.count(i.split.first)} " + "unique views"
  end

  sorted_views_array = most_views_array.sort_by { |x| x.split[1].to_i }
  sorted_unique_array = get_unique.sort_by { |x| x.split[1].to_i }
  p sorted_views_array.uniq.reverse
  p sorted_unique_array.uniq.reverse
end

file = "path_to_file"

get_list(file)