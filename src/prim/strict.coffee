require 'coffee-mate/global'
{instance} = require '../typeclass'
{match, show, samples, sample, htmlInline, htmlBlock} = require '../typespec'
{genBlockBody, isTypeSpecDict} = require '../helpers'

class Strict
	constructor: (specdict) ->
		unless isTypeSpecDict(specdict)
			throw Error "Bad Strict Type Definition: Dict Of TypeSpec Expected, But Got #{specdict}"
		return {
			constructor: Strict
			specdict: specdict
		}

instance('TypeSpec')(Strict).where
	match: ({specdict}) -> (v) ->
		v? and v.constructor is Object and (all((k) -> specdict[k]?) Object.keys(v)) and all(([k, spec]) -> match(spec) v[k]) enumerate(specdict)
	show: ({specdict}) ->
		'{' + (list map(([k, spec]) -> "#{k}: #{show spec}") enumerate(specdict)).join(', ') + '}'
	samples: ({specdict}) ->
		repeat dict list map(([k, v]) -> [k, sample v]) enumerate(specdict)
	htmlInline: ({specdict}) ->
		"<span class='type-maker'>{<span class='folded-detail'>...</span>}</span>"
	htmlBlock: ({specdict}) ->
		head: "<span class='type-maker'>{</span>"
		body: genBlockBody('strict', 'field-name') specdict
		tail: "<span class='type-maker'>}</span>"

module.exports = {Strict}