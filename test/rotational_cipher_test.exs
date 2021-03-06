defmodule RotationalCipherTest do
  use ExUnit.Case, async: true
  use Quixir
  doctest RotationalCipher

  describe "RotationalCipher.rotate/2" do
    test "rotate a by 26, same output as input" do
      plaintext = "a"
      shift = 26
      assert RotationalCipher.rotate(plaintext, shift) === "a"
    end

    test "rotate a by 0, same output as input" do
      plaintext = "a"
      shift = 0
      assert RotationalCipher.rotate(plaintext, shift) === "a"
    end

    test "rotate m by 13" do
      plaintext = "m"
      shift = 13
      assert RotationalCipher.rotate(plaintext, shift) === "z"
    end

    test "rotate n by 13 with wrap around alphabet" do
      plaintext = "n"
      shift = 13
      assert RotationalCipher.rotate(plaintext, shift) === "a"
    end

    test "rotate capital letters" do
      plaintext = "OMG"
      shift = 5
      assert RotationalCipher.rotate(plaintext, shift) === "TRL"
    end

    test "rotate spaces" do
      plaintext = "O M G"
      shift = 5
      assert RotationalCipher.rotate(plaintext, shift) === "T R L"
    end

    test "rotate numbers" do
      plaintext = "Testing 1 2 3 testing"
      shift = 4
      assert RotationalCipher.rotate(plaintext, shift) === "Xiwxmrk 1 2 3 xiwxmrk"
    end

    test "rotate punctuation" do
      plaintext = "Let's eat, Grandma!"
      shift = 21
      assert RotationalCipher.rotate(plaintext, shift) === "Gzo'n zvo, Bmviyhv!"
    end

    test "rotate all letters" do
      plaintext = "The quick brown fox jumps over the lazy dog."
      shift = 13
      assert RotationalCipher.rotate(plaintext, shift) === "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    end

    test "length of plaintext input and ciphertext output match" do
      ptest plaintext: string(), shift: int(min: 0, max: 26) do
        ciphertext = RotationalCipher.rotate(plaintext, shift)
        assert String.length(ciphertext) === String.length(plaintext)
      end
    end
  end
end
