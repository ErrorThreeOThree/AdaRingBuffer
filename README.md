# Ada exercise: Implement a generic ring buffer
This exercise is based on a generic ring buffer implementation found here: https://github.com/ErrorThreeOThree/sese-cab-service


To work through the exercise, download GNAT Studio Community, a free ADA IDE which comes with a full ADA toolchain.
You can download the IDE here: https://www.adacore.com/download
Clone this repository and open the project in GNAT Studio Community.

Your task is to add code in the files `src/main.adb`, `src/ring_buffer.adb` and `src/ring_buffer.ads`.
You can find a solution of the exercise in `src/main_solution.adb` and `src/ring_buffer_solution.adb`.

On execution, the project starts two writer threads and one reader thread.
The writer threads fill the ring buffer with characters, while the reader thread reads from the ring buffer and outputs the character to console.

# Hints:
Before implementing each functionality, think about whether the operation is a function, an entry or a procedure.
We suggest you to call the pre-implemented functions.