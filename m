Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 25166A038B3
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 08:24:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A34A206F7; Tue,  7 Jan 2025 07:24:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 07:24:09 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A6074206C0
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 07:08:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Z7hYdsI1tELE for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 07:07:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BB04B206EF
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 07:07:09 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5073s5ae013495;
	Tue, 7 Jan 2025 07:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=inaSEM
	pTVKk1ST+3srG8V1U/0h9KEiFBTVU1i7Qk0gU=; b=dr8hnk+jtUP5Iz3VCNvTvO
	cUgORr4Di+uZ8SzVPZCgkxtwSGNKSduqENIm2R0DmBsWWmvOnHm2hsDjmCrlbi9q
	mAgt+JFLxEuJKu/Tcvo3T1UV3VVEG/Q8+HjAvzN/UdyuR5XtMdOXp8gQxfWsm19X
	go1Z1l6vhaoXYQtQl/r1qx/xyV11EqAUamjMCuI7d5yKT7mk1ieR+JNNLcqMN69N
	Y+EKe1NQAnb8D6e4qPen8uC9hgOGu/ZdzcMK6sNaNi+cJI7Q7zRwrcT/TvFJjG2G
	v/4hTjVmEJBS9UxhLngKVk8M3P4e8kXtr1LSVkh2wFXppJjyu+HmEVzo+FM455JA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440vrc8q1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:06:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5073RCiW008851;
	Tue, 7 Jan 2025 07:06:55 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfpyse6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:06:55 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50776sHI32768646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 07:06:54 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 900C258064;
	Tue,  7 Jan 2025 07:06:54 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 191ED58063;
	Tue,  7 Jan 2025 07:06:51 +0000 (GMT)
Received: from [9.109.198.241] (unknown [9.109.198.241])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 07:06:50 +0000 (GMT)
Message-ID: <bb8ea315-cf16-4fd1-9680-bbc390ac1756@linux.ibm.com>
Date: Tue, 7 Jan 2025 12:36:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
        Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
        linux-nvme@lists.infradead.org, nbd@other.debian.org,
        virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-6-hch@lst.de>
 <4addcb5e-fc88-4a86-a464-cc25d8674267@linux.ibm.com>
 <20250106110532.GA22062@lst.de>
 <3fb212e4-8fff-45fc-9cff-f5b5eaff4231@linux.ibm.com>
 <20250106152708.GA27431@lst.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250106152708.GA27431@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fjpHHO44d6r9IEMzw536FE7K15i-7J20
X-Proofpoint-ORIG-GUID: fjpHHO44d6r9IEMzw536FE7K15i-7J20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=305 spamscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070056
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e-_UP242dqG.A.sbkH.ZaNfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3247
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/bb8ea315-cf16-4fd1-9680-bbc390ac1756@linux.ibm.com
Resent-Date: Tue,  7 Jan 2025 07:24:10 +0000 (UTC)



On 1/6/25 8:57 PM, Christoph Hellwig wrote:
> On Mon, Jan 06, 2025 at 05:36:52PM +0530, Nilay Shroff wrote:
>> Oh yes, I saw that you moved blk_mq_can_poll() to blk-mq.h and 
>> made it inline so thought why bdev_can_poll() can't be made inline?
> 
> It can be, but why would you want it to?  What do you gain from forcing
> the compiler to inline it, when sane compilers with a sane inlining
> threshold will do that anyway.
Hmm, ok, I was thinking just in case we want to force compiler. What if
in case compiler doesn't inline it? However, if we're moving this function
to a header then it would be made inline, anyways.
> 
>> BTW, bdev_can_poll() is  called from IO fastpath and so making it inline 
>> may slightly improve performance. 
>> On another note, I do see that blk_mq_can_poll() is now only called 
>> from bdev_can_poll(). So you may want to merge these two functions 
>> in a single call and make that inline.
> 
> I'd rather keep generic block layer logic separate from blk-mq logic.
> We tend to do a few direct calls into blk-mq from the core code to
> avoid the indirect call overhead, but we should still keep the code
> as separate as possible to keep it somewhat modular.
> 
Okay, make sense.

Thanks,
--Nilay

