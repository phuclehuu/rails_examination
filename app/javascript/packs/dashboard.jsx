import React, { Component } from 'react'
import ReactDOM from 'react-dom'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Dashboard />,
    document.body.appendChild(document.createElement('div')),
  )
})

class Dashboard extends Component {
  constructor(props) {
    super(props);

    this.state = {
      term: '',
      languages: '',
      activities: '',
      autoCompleteResults: [],
      itemSelected: {},
      showItemSelected: false
    };


    this.fetchItems(this.state).then((items)=>{
      this.setState({ autoCompleteResults: items })
    });
  }

  fetchItems(state){
  	return fetch('/search?l=' + state.languages + '&a=' + state.activities)
      .then(function(response){
        return response.json();
      }).then(function(result){
        return result.guides
      });
  }

  getAutoCompleteResults(e){
  	const target = e.target;
    const value = target.value;
    const name = target.name;
    this.setState({
      [name]: value
    }, () => {
      this.fetchItems(this.state).then((items)=>{
        this.setState({ autoCompleteResults: items })
      });
    });
  }

  //Join array objects with a string
  toString(glue, pieces, property_name){
  	let result = '';
  	if (pieces) {
      	result = pieces
      			.map((p) => { return p[property_name];})
      			.reduce((prev, curr) => [prev, ', ', curr]);
    }
    return result;
  }

  render(){
    let autoCompleteList = this.state.autoCompleteResults.map((response, index) => {
      
      return (
      	React.createElement("tr", {
		    key: index
		}, 
        React.createElement("td", null, index + 1, ". ", response.email), 
        React.createElement("td", null, this.toString(', ', response.languages, 'code')), 
        React.createElement("td", null, this.toString(', ', response.activities, 'name')))
      )
    });

    return (
    	React.createElement("div", null, 
    		React.createElement("table", {
		    width: "100%"
			}, React.createElement("tbody", null, 
				React.createElement("tr", null, 
					React.createElement("th", {
			    width: "30%"
			}, "Guide"), 
					React.createElement("th", {
			    width: "30%"
			}, "Languages"), 
					React.createElement("th", {
			    width: "40%"
			}, "Activities")), 
				React.createElement("tr", null, 
					React.createElement("td", null), 
					React.createElement("td", null, 
						React.createElement("input", {
					    ref: input => {
					        this.searchBar = input;
					    },
					    name: "languages",
					    value: this.state.languages,
					    onChange: this.getAutoCompleteResults.bind(this),
					    type: "text",
					    placeholder: "Search languages...",
					    style: {
					        width: '98%'
					    }
					})), 
					React.createElement("td", null, 
						React.createElement("input", {
					    ref: input => {
					        this.searchBar = input;
					    },
					    name: "activities",
					    value: this.state.activities,
					    onChange: this.getAutoCompleteResults.bind(this),
					    type: "text",
					    placeholder: "Search activities...",
					    style: {
					        width: '98%'
					    }
					}))
				), autoCompleteList)
			)
		)
    )
  }
}