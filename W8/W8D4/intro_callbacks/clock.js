
class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let dateNow = new Date();
    this.hours = dateNow.getHours();
    this.minutes = dateNow.getMinutes();
    this.seconds = dateNow.getSeconds();
  
  }
  
  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }
  
  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    const that = this;

    setInterval(function() {
      that.seconds += 1;
      if (that.seconds === 60) {
        that.seconds = 0;
        that.minutes += 1;
      }
      if (that.minutes === 60) {
        that.minutes = 0;
        that.hours += 1;
      }
      if (that.hours === 24) {
        that.hours = 0;
      }
      that.printTime();
    }, 1000);
  }
}
