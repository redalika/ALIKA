import React from 'react'
import Card from '../Components/shared/Card'
import { Link } from 'react-router-dom'

function AboutPage() {
  return (
    <Card className='about'>
      <div>
        <h1>About This Project</h1>
        <p>This is a React app made by Redwan</p>
        <p>Version: 1.0.1</p>
        <p>
          <Link to="/">Back To Home</Link>
        </p>
      </div>
    </Card>
  )
}

export default AboutPage