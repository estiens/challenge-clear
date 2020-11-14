import { Controller } from 'stimulus';
import StimulusReflex from 'stimulus_reflex';

export default class extends Controller {
  static targets = ['query', 'loading', 'results', 'langRuby', 'langPython', 'langJs']

  connect () {
   console.log("Here We Ar")
   StimulusReflex.register(this)
  }

  beforeCreate () {
    console.log(this.loadingTarget)
    this.loadingTarget.hidden = false
    this.resultsTarget.hidden = true
  }

  afterCreate() {
    this.loadingTarget.hidden = true
    this.resultsTarget.hidden = false
  }

  perform (event) {
    event.preventDefault()
    this.stimulate('QueryReflex#create', this.queryTarget.value, this.languageChoice)
  }

  get languageChoice() {
    if(this.langRubyTarget.checked) {
      return 'ruby'
    }
    if(this.langPythonTarget.checked) {
      return 'python'
    }
    if(this.langJsTarget.checked) {
      return 'js'
    }
  }
}
