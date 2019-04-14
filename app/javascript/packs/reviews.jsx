import React, { Component } from 'react'
import ReactDOM from 'react-dom'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Reviews />,
        document.body.appendChild(document.createElement('div')),
    )
})

class Reviews extends Component {
    constructor(pros) {
        super(pros);

        this.state = {
            errors: {score: []},
            score: '',
            comment: '',
            reviewResults: [],
            token: document.getElementsByName('csrf-token')[0].content
        };

        this.loadReviews().then((reviews) => {
            this.setState({reviewResults: reviews})
        });
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    loadReviews() {
        return fetch('', {
            headers: {
                'Accept': 'application/json',
                "Content-Type": "application/json"
            }
        }).then(function (response) {
            return response.json()
        }).then(function (reviews) {
            return reviews
        })
    }

    handleChange(e) {
        const target = e.target;
        const value = target.value;
        const name = target.name;
        this.setState({
            [name]: value
        });
    }

    handleSubmit(e) {
        let that = this;
        that.setState({errors: {score: []}});
        fetch('', {
            method: 'post',
            headers: {'Content-Type':'application/json', 'X-CSRF-Token': this.state.token},
            body: JSON.stringify({
                "score": this.state.score,
                "comment": this.state.comment
            })
        })
        .then(function(response){
            return response.json();
        }).then(function(result){
            if (typeof result.id == "undefined"){
                that.setState({
                    errors: result
                })
            }else {
                let reviews = that.state.reviewResults.slice();
                reviews.push(result);
                that.setState({
                    reviewResults: reviews
                });
            }
        });
        e.preventDefault();
    }

    deleteReview(e) {
        e.preventDefault();
        console.log('The link was clicked.');
        // fetch(review.url, {
        //     method: 'delete',
        //     headers: {'Content-Type':'application/json', 'X-CSRF-Token': this.state.token},
        //     body: JSON.stringify({
        //         "_method": "delete",
        //         "authenticity_token": this.state.token
        //     })
        // })
        // .then(function(response){
        //     return response.json();
        // }).then(function(result){
        //     return result;
        // });
    }

    render() {
        let reviews = this.state.reviewResults.map((response, index) => {

            return (
                React.createElement("tr", {
                        key: index
                    },
                    React.createElement("td", null, response.score),
                    React.createElement("td", null, response.comment),
                    React.createElement("td", null, React.createElement('a', {
                        // href: response.url,
                        href: '#',
                        // 'data-confirm': 'Are you sure?',
                        'data-method': 'delete',
                        onClick: this.deleteReview
                    }, 'Delete'))
            ));
        });
        let errors = this.state.errors.score.map((error, index) => {
           return (
               React.createElement('li', {style: {color: 'red'}}, 'Score ' + error)
           )
        });
        return (
                React.createElement("div", {},
                    React.createElement('ul', {}, errors),
                    React.createElement("form", {
                            onSubmit: this.handleSubmit
                        },
                        React.createElement("div",{
                                className: "field"
                            },
                            React.createElement("label", {}, "Score: "),
                            React.createElement("input", {
                                type: "text", name: "score", value: this.state.score, onChange: this.handleChange
                            })),
                        React.createElement("div",{
                                className: "field"
                            },
                            React.createElement("label", {}, "Comment: "),
                            React.createElement("textarea", {
                                name: "comment", value: this.state.comment, onChange: this.handleChange
                            })),
                        React.createElement("input", {
                            type: "submit", value: "Submit"
                        })
                    ),
                    React.createElement("table", {
                            width: "100%"
                        }, React.createElement("tbody", null,
                        React.createElement("tr", null,
                            React.createElement("th", {
                                width: "30%"
                            }, "Score"),
                            React.createElement("th", {
                                width: "30%"
                            }, "Comment"),
                            React.createElement("th", {
                                width: "40%"
                            }, "Action")), reviews)
                    )
                )
        );
    }
}