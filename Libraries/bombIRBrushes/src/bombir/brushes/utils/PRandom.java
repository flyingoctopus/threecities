package bombir.brushes.utils;

import java.util.Random;


/**
 * Copied sourcecode from https://code.google.com/p/processing/source/browse/trunk/processing/core/methods/demo/PApplet.java 
 * for using the same random function then in processing
 * 
 * @author Hauke Altmann
 *
 */
public class PRandom {
	
	 Random internalRandom;

	 /**
	 * Return a random number in the range [0, howbig).
	 * <P>
	 * The number returned will range from zero up to
	 * (but not including) 'howbig'.
	 */
	 public final float random(float howbig) {
		 // for some reason (rounding error?) Math.random() * 3
		 // can sometimes return '3' (once in ~30 million tries)
		 // so a check was added to avoid the inclusion of 'howbig'
	
		 // avoid an infinite loop
		 if (howbig == 0) return 0;
	
		 // internal random number object
		 if (internalRandom == null) internalRandom = new Random();
	
		 float value = 0;
		 do {
			 //value = (float)Math.random() * howbig;
			 value = internalRandom.nextFloat() * howbig;
		 } while (value == howbig);
		 return value;
	 }


	 /**
	 * Return a random number in the range [howsmall, howbig).
	 * <P>
	 * The number returned will range from 'howsmall' up to
	 * (but not including 'howbig'.
	 * <P>
	 * If howsmall is >= howbig, howsmall will be returned,
	 * meaning that random(5, 5) will return 5 (useful)
	 * and random(7, 4) will return 7 (not useful.. better idea?)
	 */
	 public final float random(float howsmall, float howbig) {
		 if (howsmall >= howbig) return howsmall;
		 float diff = howbig - howsmall;
		 return random(diff) + howsmall;
	 }


	 public final void randomSeed(long what) {
		 // internal random number object
		 if (internalRandom == null) internalRandom = new Random();
		 internalRandom.setSeed(what);
	 }

}
