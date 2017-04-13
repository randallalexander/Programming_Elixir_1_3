defmodule MyList do
  def len([]), do: 0
  def len([_head|[]]), do: 1
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | [] ]), do: [ head*head ]
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([ head | []]), do: [head+1]
  def add_1([ head | tail ]), do: [ head+1 | add_1(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def sum(list), do: _sum(list, 0)
  # private methods
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head+total)

  def sum1([]), do: 0
  def sum1( [head | []] ), do: head
  def sum1( [head | list]), do: head + sum1(list)

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], _func), do: 0
  def mapsum([ head | tail ], func), do: sum([ func.(head) | map(tail, func) ])

  def max([head |[]]), do: head
  def max([head | tail]), do: Kernel.max(head,  max(tail))

  def caesar([], _offset), do: []
  def caesar([head | rest], offset) when head + offset <= ?z, do: [head + offset | caesar(rest, offset)]
  def caesar([head | rest], offset), do: [ head + offset - (?z - ?a + 1) | caesar(rest, offset) ]
end