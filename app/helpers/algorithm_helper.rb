module AlgorithmHelper
  def random_algorithm
    @random = Algorithm.order(Arel.sql('RANDOM()')).first
  end
end
