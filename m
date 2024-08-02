Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2B94623F
	for <lists+nbd@lfdr.de>; Fri,  2 Aug 2024 19:06:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0D7AA20566; Fri,  2 Aug 2024 17:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  2 17:06:09 2024
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 101AB20570
	for <lists-other-nbd@bendel.debian.org>; Fri,  2 Aug 2024 16:49:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.098 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id h9-U3ruW081L for <lists-other-nbd@bendel.debian.org>;
	Fri,  2 Aug 2024 16:49:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ibm. - helo: .mx0b-001b2d01.pphosted. - helo-domain: .pphosted.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 80BFE20552
	for <nbd@other.debian.org>; Fri,  2 Aug 2024 16:49:46 +0000 (UTC)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472FTBA7011799;
	Fri, 2 Aug 2024 16:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	cg/bndupk50rnRSsxm4uXdUIHZrNSZ5AzvafipUGmz8=; b=nbwlj3xPgqLjq4hn
	BiMRfwpOq2AnIqP8YUvW+A7E9apEy/G92t3teOEmJ7tok9sCwLwRLaEY8mxlknSA
	PeWIEjCoKgyx8L2LizMomvysWqlDZbIyz2Cb7nXIYIdeoCJLJJfT/3lqnMQmu1fh
	4KGUTtA71ymfWwgSFLExdrDtrQJbxcpBLptN/JIkHUt4Mft0NqwGZkDZfVTQCJJS
	nWbR1nuBIGYB27uucrrRlap9wiHjgs/pP66WoJYUBuZOg/eanxLxijXrUpItt7nK
	/dtdR1GBDuUx4zXimMChvduXm42l5AyGY3rTrd/Auaqtjq19uDIxOK2fl6t+kxEo
	8gZN/g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40s1pf07d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 16:49:37 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 472Gnbuk018859;
	Fri, 2 Aug 2024 16:49:37 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40s1pf07d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 16:49:37 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 472DmSUY029103;
	Fri, 2 Aug 2024 16:49:36 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nbm18a24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 16:49:36 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 472GnYmA16974424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2024 16:49:36 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 255C758043;
	Fri,  2 Aug 2024 16:49:34 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D97758053;
	Fri,  2 Aug 2024 16:49:31 +0000 (GMT)
Received: from [9.171.33.192] (unknown [9.171.33.192])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Aug 2024 16:49:31 +0000 (GMT)
Message-ID: <79a7ec0d-c22d-44cf-a832-13da05a1fcbd@linux.ibm.com>
Date: Fri, 2 Aug 2024 22:19:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.11-rc1 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "nbd@other.debian.org" <nbd@other.debian.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        Yi Zhang <yi.zhang@redhat.com>
References: <5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrnbuyxioaxjgbojsi@o2arvhebzes3>
 <ab363932-ab3d-49b1-853d-7313f02cce9e@linux.ibm.com>
 <ljqlgkvhkojsmehqddmeo4dng6l3yaav6le2uslsumfxivluwu@m7lkx3j4mkkw>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <ljqlgkvhkojsmehqddmeo4dng6l3yaav6le2uslsumfxivluwu@m7lkx3j4mkkw>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tkuW1usVc4_L-ZsXnVMafpq53k4_2E6j
X-Proofpoint-GUID: a115jAe8d2xS4aK9ey4Ffkuh_ApZccBy
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_12,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020114
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rQ63ZcwuQgE.A.p7h.BIRrmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3115
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/79a7ec0d-c22d-44cf-a832-13da05a1fcbd@linux.ibm.com
Resent-Date: Fri,  2 Aug 2024 17:06:10 +0000 (UTC)



On 8/2/24 18:04, Shinichiro Kawasaki wrote:
> CC+: Yi Zhang,
> 
> On Aug 02, 2024 / 17:46, Nilay Shroff wrote:
>>
>>
>> On 8/2/24 14:39, Shinichiro Kawasaki wrote:
>>>
>>> #3: nvme/052 (CKI failure)
>>>
>>>    The CKI project reported that nvme/052 fails occasionally [4].
>>>    This needs further debug effort.
>>>
>>>   nvme/052 (tr=loop) (Test file-ns creation/deletion under one subsystem) [failed]
>>>       runtime    ...  22.209s
>>>       --- tests/nvme/052.out	2024-07-30 18:38:29.041716566 -0400
>>>       +++ /mnt/tests/gitlab.com/redhat/centos-stream/tests/kernel/kernel-tests/-/archive/production/kernel-tests-production.zip/storage/blktests/nvme/nvme-loop/blktests/results/nodev_tr_loop/nvme/052.out.bad	2024-07-30 18:45:35.438067452 -0400
>>>       @@ -1,2 +1,4 @@
>>>        Running nvme/052
>>>       +cat: /sys/block/nvme1n2/uuid: No such file or directory
>>>       +cat: /sys/block/nvme1n2/uuid: No such file or directory
>>>        Test complete
>>>
>>>    [4] https://datawarehouse.cki-project.org/kcidb/tests/13669275
>>
>> I just checked the console logs of the nvme/052 and from the logs it's 
>> apparent that all namespaces were created successfully and so it's strange
>> to see that the test couldn't access "/sys/block/nvme1n2/uuid".
> 
> I agree that it's strange. I think the "No such file or directory" error
> happened in _find_nvme_ns(), and it checks existence of the uuid file before
> the cat command. I have no idea why the error happens.
> 
Yes exactly, and these two operations (checking the existence of uuid
and cat command) are not atomic. So the only plausible theory I have at this 
time is "if namespace is deleted after checking the existence of uuid but 
before cat command is executed" then this issue may potentially manifests. 
Furthermore, as you mentioned, this issue is seen on the test machine 
occasionally, so I asked if there's a possibility of simultaneous blktest 
or some other tests running on this system.

Thanks,
--Nilay

