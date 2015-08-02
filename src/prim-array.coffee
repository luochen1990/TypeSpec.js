require 'coffee-mate/global'
{instance} = require './typeclass'
{match, show, samples, sample} = require './typespec'

instance('TypeSpec')(Array).where
	match: ([spec]) -> (v) ->
		v.constructor is Array and all(match spec) v
	show: ([spec]) ->
		"[#{show spec}]"
	samples: ([spec]) ->
		concat repeat reverse map((n) -> list take(n) samples spec) range(4)
	sample: ([spec]) ->
		[sample spec]
