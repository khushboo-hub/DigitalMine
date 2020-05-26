# import serial  # import Serial Library
# # from serial import serial
# import numpy  # Import numpy
# import matplotlib.pyplot as plt  # import matplotlib library
# from drawnow import *
#
# tempF = []
# pressure = []
# arduinoData = serial.Serial('com4', 9600)  # Creating our serial object named arduinoData
# print(arduinoData)
# plt.ion()  # Tell matplotlib you want interactive mode to plot live data
# cnt = 0
#
#
# def makeFig():  # Create a function that makes our desired plot
#     plt.ylim(30, 35)  # Set y min and max values
#     plt.title('My Live Streaming Sensor Data')  # Plot the title
#     plt.grid(True)  # Turn the grid on
#     plt.margins(0)
#
#     plt.axhspan(30, 31, facecolor='green', alpha=0.5)
#     plt.axhspan(31, 34, facecolor='yellow', alpha=0.5)
#     plt.axhspan(34, 35, facecolor='red', alpha=0.5)
#     plt.ylabel('Temp F')  # Set ylabels
#     plt.plot(tempF, 'ro-', label='Degrees F')  # plot the temperature
#     plt.legend(loc='upper left')  # plot the legend
#     plt2 = plt.twinx()  # Create a second y axis
#     plt.ylim(230, 235)  # Set limits of second y axis- adjust to readings you are getting
#     plt2.plot(pressure, 'b^-', label='Pressure (Pa)')  # plot pressure data
#     plt2.set_ylabel('Pressure (Pa)')  # label second y axis
#     plt2.ticklabel_format(useOffset=False)  # Force matplotlib to NOT autoscale y axis
#     plt2.legend(loc='upper right')  # plot the legend
#
#
# while True:  # While loop that loops forever
#     while (arduinoData.inWaiting() == 0):  # Wait here until there is data
#         pass  # do nothing
#     arduinoString = arduinoData.readline()  # read the line of text from the serial port
#     dataArray = arduinoString.split(b',')  # Split it into an array called dataArray
#     temp = float(dataArray[0])  # Convert first element to floating number and put in temp
#     P = float(dataArray[1])  # Convert second element to floating number and put in P
#     tempF.append(temp)  # Build our tempF array by appending temp readings
#     pressure.append(P)  # Building our pressure array by appending P readings
#     drawnow(makeFig)  # Call drawnow to update our live graph
#     plt.pause(.000001)  # Pause Briefly. Important to keep drawnow from crashing
#     cnt = cnt + 1
#     # if (cnt > 50):  # If you have 50 or more points, delete the first one from the array
#     #     tempF.pop(0)  # This allows us to just see the last 50 data points
#     #     pressure.pop(0)
#
#         # x = [1, 2, 3, 4, 5, 6, 7, 8]  # fake data
#         # y = [1, 2, 3, 4, 3, 2, 9, 12]
#         #
#         # fig, ax = plt.subplots()
#         #
#         # ax.plot(x, y, 'k')
#         # ax.grid()
#         # ax.margins(0)  # remove default margins (matplotlib verision 2+)
#         #
#         # ax.axhspan(0, 4, facecolor='green', alpha=0.5)
#         # ax.axhspan(4, 9, facecolor='yellow', alpha=0.5)
#         # ax.axhspan(9, 12, facecolor='red', alpha=0.5)
#         #
#         # plt.show()
