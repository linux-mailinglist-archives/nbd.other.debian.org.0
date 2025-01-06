Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E9A0253D
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 13:24:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2C0B320751; Mon,  6 Jan 2025 12:24:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 12:24:21 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 324642071E
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 12:07:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ortAi3Sfgs6d for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 12:07:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C553C2071B
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 12:07:19 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50600EP9030214;
	Mon, 6 Jan 2025 12:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5VYWlz
	s54e2fOmMAsKWa3Enn7OneHP0TVzdAjmuEUBA=; b=MmnwOSfrasbMdxNoavd2+L
	4d7fSl3FOGZplpA4l0jmfDLoT9xlvB+sAsuxkdGIgqXdrZ+8XzudwBEaU6SRpvEn
	1uzFkzlm0CHPNoLibzdYj0GZLuGvNj8vgKYb64JZar11tcW3EfCoXL9rYebMJkHr
	TL1S2733SpeMdbLtDcSY6KjOxLLS1NOeodkCGC85+LwovgmIYUHHmivalelEMGPd
	bnPzz7e6mVBOIS6DRq6zVGgz6Mxc9Wckub2qUecurHEpV8fN3pZ0R0qIC4eRPksN
	gA62FgNVMFf6/gDTiGgv6dARaBzcBdmGVEIOMHflttA4tj6Jpo+AcwOrvvoMfuRA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44047haeuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 12:06:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50696WKH003630;
	Mon, 6 Jan 2025 12:06:58 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfaswspx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 12:06:58 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506C6vCc32244426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 12:06:57 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62C0258058;
	Mon,  6 Jan 2025 12:06:57 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F24FD5805C;
	Mon,  6 Jan 2025 12:06:53 +0000 (GMT)
Received: from [9.171.85.164] (unknown [9.171.85.164])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 12:06:53 +0000 (GMT)
Message-ID: <3fb212e4-8fff-45fc-9cff-f5b5eaff4231@linux.ibm.com>
Date: Mon, 6 Jan 2025 17:36:52 +0530
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
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250106110532.GA22062@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FGJElPxHemmUGQZFUCCrmUdflIso0Eah
X-Proofpoint-ORIG-GUID: FGJElPxHemmUGQZFUCCrmUdflIso0Eah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=380 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060106
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8c1I6e9gOoP.A.ZSDH.1t8enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3230
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3fb212e4-8fff-45fc-9cff-f5b5eaff4231@linux.ibm.com
Resent-Date: Mon,  6 Jan 2025 12:24:21 +0000 (UTC)



On 1/6/25 4:35 PM, Christoph Hellwig wrote:
> On Mon, Jan 06, 2025 at 04:31:23PM +0530, Nilay Shroff wrote:
>>> +static bool bdev_can_poll(struct block_device *bdev)
>>> +{
>>> +	struct request_queue *q = bdev_get_queue(bdev);
>>> +
>>> +	if (queue_is_mq(q))
>>> +		return blk_mq_can_poll(q->tag_set);
>>> +	return q->limits.features & BLK_FEAT_POLL;
>>> +}
>>> +
>>
>> Should we make bdev_can_poll() inline ?
> 
> I don't really see the point.  It's file local and doesn't have any
> magic that could confuse the code generator, so we might as well leave
> it to the compiler.  Although that might be about to change per the
> discussion with Damien, which could require it in blk-sysfs, in
> which case it should become an inline in a header.
> 
Oh yes, I saw that you moved blk_mq_can_poll() to blk-mq.h and 
made it inline so thought why bdev_can_poll() can't be made inline?
BTW, bdev_can_poll() is  called from IO fastpath and so making it inline 
may slightly improve performance. 
On another note, I do see that blk_mq_can_poll() is now only called 
from bdev_can_poll(). So you may want to merge these two functions 
in a single call and make that inline.

Thanks,
--Nilay

