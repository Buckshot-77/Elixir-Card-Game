defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """


  # comprehentions (for loops) are inherently a map.

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a `deck` and returns the cards in a random order.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if a card is contained in the deck.
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals a hand to the caller according to the `hand_size` requested.


  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Jack of Hearts"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the `deck` into a file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a `deck` from a file.
  """
  def load(filename) do
    read_tuple = File.read(filename)

    case read_tuple do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _error_message} -> "That file does not exist."
    end
  end

  @doc """
    Creates a deck, shuffles it, and then deals a hand according to the `hand_size`.
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |>Cards.shuffle()
    |>Cards.deal(hand_size)
  end
end
