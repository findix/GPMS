package com.find1x.gpms.pojos;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;

@Entity("syscontrol")
public class SysControl {
	@Id
	private ObjectId _id;
	private boolean s1;
	private boolean s2;
	private boolean s3;
	private boolean s4;
	private boolean s5;
	private boolean s6;
	private boolean s7;
	private boolean s8;
	private boolean s9;
	private boolean s10;
	private boolean s11;

	/**
	 * @return the _id
	 */
	public ObjectId get_id() {
		return _id;
	}

	/**
	 * @param _id
	 *            the _id to set
	 */
	public void set_id(ObjectId _id) {
		this._id = _id;
	}

	/**
	 * @return the s1
	 */
	public boolean isS1() {
		return s1;
	}

	/**
	 * @param s1
	 *            the s1 to set
	 */
	public void setS1(boolean s1) {
		this.s1 = s1;
	}

	/**
	 * @return the s2
	 */
	public boolean isS2() {
		return s2;
	}

	/**
	 * @param s2
	 *            the s2 to set
	 */
	public void setS2(boolean s2) {
		this.s2 = s2;
	}

	/**
	 * @return the s3
	 */
	public boolean isS3() {
		return s3;
	}

	/**
	 * @param s3
	 *            the s3 to set
	 */
	public void setS3(boolean s3) {
		this.s3 = s3;
	}

	/**
	 * @return the s4
	 */
	public boolean isS4() {
		return s4;
	}

	/**
	 * @param s4
	 *            the s4 to set
	 */
	public void setS4(boolean s4) {
		this.s4 = s4;
	}

	/**
	 * @return the s5
	 */
	public boolean isS5() {
		return s5;
	}

	/**
	 * @param s5
	 *            the s5 to set
	 */
	public void setS5(boolean s5) {
		this.s5 = s5;
	}

	/**
	 * @return the s6
	 */
	public boolean isS6() {
		return s6;
	}

	/**
	 * @param s6
	 *            the s6 to set
	 */
	public void setS6(boolean s6) {
		this.s6 = s6;
	}

	/**
	 * @return the s7
	 */
	public boolean isS7() {
		return s7;
	}

	/**
	 * @param s7
	 *            the s7 to set
	 */
	public void setS7(boolean s7) {
		this.s7 = s7;
	}

	/**
	 * @return the s8
	 */
	public boolean isS8() {
		return s8;
	}

	/**
	 * @param s8
	 *            the s8 to set
	 */
	public void setS8(boolean s8) {
		this.s8 = s8;
	}

	/**
	 * @return the s9
	 */
	public boolean isS9() {
		return s9;
	}

	/**
	 * @param s9
	 *            the s9 to set
	 */
	public void setS9(boolean s9) {
		this.s9 = s9;
	}

	/**
	 * @return the s10
	 */
	public boolean isS10() {
		return s10;
	}

	/**
	 * @param s10
	 *            the s10 to set
	 */
	public void setS10(boolean s10) {
		this.s10 = s10;
	}

	/**
	 * @return the s11
	 */
	public boolean isS11() {
		return s11;
	}

	/**
	 * @param s11
	 *            the s11 to set
	 */
	public void setS11(boolean s11) {
		this.s11 = s11;
	}

}
