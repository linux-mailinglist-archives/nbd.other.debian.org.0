Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AFA03A85
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 10:03:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7222420721; Tue,  7 Jan 2025 09:03:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 09:03:11 2025
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
	by bendel.debian.org (Postfix) with ESMTP id 2E48D206FB
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 08:45:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DdcNIroF2ePX for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 08:45:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DBE04206E8
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 08:45:23 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506NxA3J024138;
	Tue, 7 Jan 2025 08:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=An/7Yw
	PguZdZtal5mzGdVsZ80ntnWORr30SjufRrII0=; b=HV9jqXTDog6DuJXx7UQuNn
	1lWXprILaAQdnkRIw/5lvBf9mOi9NdXSspgz6UYADush991ZiPFzbYG9Co++eE5o
	7SFxIp7I5TSqQr+gJBjqGD2kPWpf2vEdAzqHExb3Alj0gkemXg/0w/WciXzLh+Rp
	RYbzMlffDTVGx7KKyy8rTHUWJduWUxDLvCWFF3+tvgIWkFujeQhE0vw6C+CRGGNr
	qRGbhi8bI/iMd7fVRppwqCby2jRVEPvlDxoC7cDR/wVmiALdmRbCfO7+QisdoJTH
	BkbAQKGy2eY2rORPYdZ29fbYlSPZ+FEtEdbqPpfbRy48+LawCyingz4eEwghPuTA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440sahhucs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 08:45:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50768hx9026171;
	Tue, 7 Jan 2025 08:45:10 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj121bdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 08:45:10 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5078jAkh16777844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 08:45:10 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29F7F5805A;
	Tue,  7 Jan 2025 08:45:10 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 147D758052;
	Tue,  7 Jan 2025 08:45:07 +0000 (GMT)
Received: from [9.109.198.241] (unknown [9.109.198.241])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 08:45:06 +0000 (GMT)
Message-ID: <263963d9-ac40-4f87-b38a-edb4202d294c@linux.ibm.com>
Date: Tue, 7 Jan 2025 14:15:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] nvme: fix queue freeze vs limits lock order
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
        Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
        linux-nvme@lists.infradead.org, nbd@other.debian.org,
        linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-7-hch@lst.de>
 <96c48ba0-3db5-4504-a456-e57440aa1b56@linux.ibm.com>
 <20250107082224.GB15960@lst.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250107082224.GB15960@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M2dqWYWIBMLItYkJibPc5ndXAo2l1a2P
X-Proofpoint-ORIG-GUID: M2dqWYWIBMLItYkJibPc5ndXAo2l1a2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=536 impostorscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070070
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MTynWIC7TmM.A.Jy3I.P3OfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3254
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/263963d9-ac40-4f87-b38a-edb4202d294c@linux.ibm.com
Resent-Date: Tue,  7 Jan 2025 09:03:11 +0000 (UTC)



On 1/7/25 1:52 PM, Christoph Hellwig wrote:
> On Tue, Jan 07, 2025 at 12:28:29PM +0530, Nilay Shroff wrote:
>>> -	blk_mq_freeze_queue(ns->disk->queue);
>>>  	lim = queue_limits_start_update(ns->disk->queue);
>>>  	nvme_set_ctrl_limits(ns->ctrl, &lim);
>>> +
>>> +	blk_mq_freeze_queue(ns->disk->queue);
>>>  	ret = queue_limits_commit_update(ns->disk->queue, &lim);
>>>  	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
>>>  	blk_mq_unfreeze_queue(ns->disk->queue);
>>
>> I think we should freeze queue before nvme_set_ctrl_limits(). 
> 
> Why?
>
The nvme_set_ctrl_limits() sets certain queue limits which are 
also used during IO processing. For instance, ->max_segment_size
is used while submitting bio.
Also, if we look at the code before your patch, nvme_set_ctrl_limits()
is called when the queue is freezed.

Thanks,
--Nilay

