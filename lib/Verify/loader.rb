
class Loader

  def load path
    path_list = parse path

    run path_list
  end

  def run(path_list)
    load_classes path_list

    classes = Theory.for Verify::Assumption

    results = {}

    classes.each do |verifier|
      results[verifier] = verifier.prove
    end

    puts results
  end

  def load_classes path_list
    path_list.each do |path|
      eval File.read("./#{path}")
    end
  end

  def parse path
    Dir.glob(path)
  end

end
