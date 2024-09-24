extends Node2D

var JSONN = JSON
var HTTP: HTTPRequest
var sheetname = "data"
var apiurl = "https://script.google.com/macros/s/AKfycbzNbv97BmuRK3HknVa-7FBe0cQ5IeXINN0U42vN07gzdBkol4wpgTKFywl_FMVdPTY/exec"
var geturl = apiurl + "?sheetname=" + sheetname
var SEND = false
@onready var button = $next


func _ready():
	HTTP = $HTTPRequest
	button.set_visible(false)
	getdata()

func _on_request_completed(_result, response_code, _headers, body): 
	if response_code == 200:
		$Label.text = "Fetched: " + sheetname
		var json_parser = JSONN.new()
		var json_data = json_parser.parse(body.get_string_from_utf8())
		if "TOTAL_score" in json_data:
			$SCORE.text = "Score: " + str(json_data["TOTAL_score"])
		else:
			print(response_code)
			$Label.text = "Failed to fetch data. Response code: " + str(response_code)
			getdata()

func getdata():
	$Label.text = "Click here after filling out the information."
	$HTTPRequest.request(geturl)
	SEND = false

func _process(delta):
	$SCORE.text = ("5")
	$"Game name".text= str("SayWords")

func _on_send_pressed():
	SEND = true
	$Label.text = "SENDING DATA"
	
	var date = str($date.text)
	var time = str($time.text)
	var score = str($SCORE.text)
	var gamename = str($"Game name".text)
	
	var data = {
		"date": date,
		"time": time,
		"score": score,
		"gamename":gamename
	}
	
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify(data)
	$HTTPRequest.request(apiurl, headers,HTTPClient.METHOD_POST, body)
	SEND = false
	$Label.text = "SEND COMPLETED"
	button.set_visible(true)

func _on_ref_pressed():
	getdata()


func _on_next_pressed():
	
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/Game/Game.tscn")
