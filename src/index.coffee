require './prim-constructor'
require './prim-object'
require './prim-array'
{Bool} = require './prim-bool'
{Any} = require './prim-any'
{Enum} = require './prim-enum'
{Maybe} = require './prim-maybe'
{Either} = require './prim-either'
{Dict} = require './prim-dict'
{Strict} = require './prim-strict'
{Data} = require './prim-data'
{match, show} = require './typespec'

module.exports = {
	Number, String,
	Bool, Any, Enum, Maybe, Either, Dict, Strict, Data,
	match, show,
}

if module.parent is null
	require 'coffee-mate/global'
	UserName = Maybe String
	UserInfo = {
		name: UserName
		position: String
		age: Number
	}
	log -> match(UserName) 'luo'
	log -> match(UserName) 1
	log -> show UserName
	log -> show UserInfo

	TableName = String
	FieldName = String
	Comparator = Enum ['<', '<=', '=', '>=', '>']
	WideTable = [{
		tableName: TableName
		join: {
			leftTableName: TableName
			left: FieldName
			op: Comparator
			right: FieldName
		}
	}]
	log -> show WideTable

