Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BDA04903
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 19:12:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2FAD820796; Tue,  7 Jan 2025 18:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 18:12:10 2025
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
	by bendel.debian.org (Postfix) with ESMTP id E2D0F20762
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 17:55:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ugPU1nlDmEvv for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 17:55:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B3ACF2072D
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 17:55:33 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50785vCe018355;
	Tue, 7 Jan 2025 17:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HMbO7h
	lrNMTXdmKpONt1Aq5oqQ7AJaSHQUMIYEFQ2eM=; b=rH/32Jzhhc0EqC0znhQbva
	TFlpRy0o2f7EjmFxAmWTHiEprXvFNsytn3AkHQeFCH1m+LhvAXkKCo5lUWHWtcOu
	6iaXmzz9KFZjr91yPmCfaukiCJjsnd/GIH+4bjfrPikbq4lXrAinmYBfvUQnoAWc
	Anf2WlMNOaLaBeCVOZA0m29GZPhjSkJEyrLLLqhMGHcYQCBt0lw46LA89NaUWzye
	Z9xnaovNeKoDGbf/v0W8GXgMqGLhMM/Zu5WbQTQDQAAKxntenvDdNDZboNqp+vos
	W1k5bLlonIqq0vYAaP958h/U5KKVo120QOjcoT/Mv5dWeRKZz2F5fo0WraSz3q/Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4410f3anky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 17:55:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 507H06SB013571;
	Tue, 7 Jan 2025 17:55:20 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yganuq1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 17:55:20 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 507HtJjd62980550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 17:55:20 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C9025805E;
	Tue,  7 Jan 2025 17:55:19 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CED0758056;
	Tue,  7 Jan 2025 17:55:16 +0000 (GMT)
Received: from [9.171.94.59] (unknown [9.171.94.59])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 17:55:16 +0000 (GMT)
Message-ID: <28ac4f43-7454-4cfa-b84e-1f9d5e88ae4c@linux.ibm.com>
Date: Tue, 7 Jan 2025 23:25:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
        Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
        linux-nvme@lists.infradead.org, nbd@other.debian.org,
        linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-4-hch@lst.de>
 <220cdd33-527f-405d-90af-2abaace36645@linux.ibm.com>
 <20250107082145.GA15960@lst.de>
 <90ae40c5-b695-4e17-8293-6a61648ed24a@linux.ibm.com>
 <20250107135153.GB22046@lst.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250107135153.GB22046@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fsV-E_6bOkHQDwwiIcx32pKWFDomgWq6
X-Proofpoint-ORIG-GUID: fsV-E_6bOkHQDwwiIcx32pKWFDomgWq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070146
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qXrzEth7ltP.A.9GpO.65WfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3267
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/28ac4f43-7454-4cfa-b84e-1f9d5e88ae4c@linux.ibm.com
Resent-Date: Tue,  7 Jan 2025 18:12:10 +0000 (UTC)



On 1/7/25 7:21 PM, Christoph Hellwig wrote:
> On Tue, Jan 07, 2025 at 02:53:40PM +0530, Nilay Shroff wrote:
>> When I applied you patch on my system and access io_poll attribute
>> of one of my nvme disk, I see it returns 1, though I didn't configure 
>> poll queue for the disk. With this patch, as we're now always setting 
>> BLK_FEAT_POLL (under blk_mq_alloc_queue()) it return 1. So when I haven't
>> configured poll queue for NVMe driver, shouldn't it return 0 when I access 
>> /sys/block/nvmeXnY/queue/io_poll ?  
> 
> While that was the case with the previous RFC series it should not be
> the case with this version, as the nvme driver does not enable the
> poll tag set map unless poll queues are enabled.  I also double checked
> that I do not see it on any of my test setups.
> 
Ohk I did install previous RFC series and tested it. 
On another note, with latest patch series, assuming NVMe driver reports polling 
support when it's loaded, accessing io_poll under sysfs reports 1. This is good.
However later resizing queue so that no poll queue is left and I reset the controller
and then access the io_poll it still reports 1. Is this expected? Other than this 
everything else looks fine.

Thanks,
--Nilay

