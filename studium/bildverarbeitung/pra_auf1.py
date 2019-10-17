
import cv2 

bild = cv2.imread('image.jpg')
h , w = bild.shape[:2]
center = (w//2 , h//2)
angle = 0
cv2.imshow('myimage' ,bild)
while True : 
    k = cv2.waitKey(0)
    if k == ord('l'):
        angle +=1
        m =cv2.getRotationMatrix2D(center,angle,1.0)
        rotated = cv2.warpAffine(bild, m, (w, h))
        cv2.imshow('myimage' ,rotated)
    elif k== ord('r'):
        angle -= 1
        m =cv2.getRotationMatrix2D(center,angle,1.0)
        rotated = cv2.warpAffine(bild, m, (w, h))
        cv2.imshow('myimage' , rotated)
    else : 
        cv2.destroyAllWindows()
        break





#cv2.rectangle(bild, (150,0),(350,200), (0,0,255), 5)
#cv2.putText(bild,'+',(150,100) , cv2.CV_16S,3 , (0,0,255))






