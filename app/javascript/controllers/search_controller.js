import { Controller } from 'stimulus';
import StimulusReflex from 'stimulus_reflex';

export default class extends Controller {
  static targets = ['query', 'loading', 'results', 'langRuby', 'langPython', 'langJs']

  connect () {
   StimulusReflex.register(this)
  }

  beforeCreate () {
    this.loadingTarget.hidden = false
    this.resultsTarget.hidden = true
  }

  afterCreate() {
    this.loadingTarget.hidden = true
    this.resultsTarget.hidden = false
  }

  perform (event) {
    event.preventDefault()
    this.stimulate('QueryReflex#create', { query: this.queryTarget.value, lang: this.languageChoice } )
  }

  get languageChoice() {
    if(this.langRubyTarget.checked) {
      return 'ruby'
    }
    if(this.langPythonTarget.checked) {
      return 'python'
    }
    if(this.langJsTarget.checked) {
      return 'javascript'
    }
  }
}
