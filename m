Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B301945DCE
	for <lists+nbd@lfdr.de>; Fri,  2 Aug 2024 14:33:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C4CAC20555; Fri,  2 Aug 2024 12:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  2 12:33:13 2024
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EF6DF2050C
	for <lists-other-nbd@bendel.debian.org>; Fri,  2 Aug 2024 12:17:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.098 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9oEpSteLTJ-5 for <lists-other-nbd@bendel.debian.org>;
	Fri,  2 Aug 2024 12:17:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ibm. - helo: .mx0a-001b2d01.pphosted. - helo-domain: .pphosted.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CAF7720480
	for <nbd@other.debian.org>; Fri,  2 Aug 2024 12:17:02 +0000 (UTC)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472AuAU3022965;
	Fri, 2 Aug 2024 12:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	gfrQUcaV+s7Gq+mfEJj2TyZrzhoHEQtKSiBupzjJV6w=; b=WbN0ni5jlWG+TLVK
	tjVqme9RTMj8HccdsCMCd+LnwFdp+l1FboMEB6tD/JrW0MK/x0qAN3VF+6xyikKJ
	YV/DXHoPzp/rXirQmwroXXop/oNkC3UuE5NoFx+lvPnXAH69/X26WIGpB+m1K6Gg
	rctsAE2V7NOQxxvrImmEk5W3H8P+oO2fQclFWJlu9UHR0IJO0gIrqQpIold1o6d4
	YwjyR/VdYAfBvxhLd2wKUynfQ+fbAzUwrksUno3aV8qy/8NkB0/KbEEr3lN1Fw5b
	3uaxtZzJ6fk/tyBLZPPVQLWdDYn/G+DYE1WblYRjU5HDj14Ly5uGNJ2Pjp8nd2Sn
	LnzDMA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ru3grjp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 12:16:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 472A02Gl007682;
	Fri, 2 Aug 2024 12:16:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40nb7uqd6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 12:16:53 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 472CGpuZ25625122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2024 12:16:53 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 379225805D;
	Fri,  2 Aug 2024 12:16:51 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11C6758052;
	Fri,  2 Aug 2024 12:16:49 +0000 (GMT)
Received: from [9.109.198.216] (unknown [9.109.198.216])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Aug 2024 12:16:48 +0000 (GMT)
Message-ID: <ab363932-ab3d-49b1-853d-7313f02cce9e@linux.ibm.com>
Date: Fri, 2 Aug 2024 17:46:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.11-rc1 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "nbd@other.debian.org" <nbd@other.debian.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrnbuyxioaxjgbojsi@o2arvhebzes3>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrnbuyxioaxjgbojsi@o2arvhebzes3>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bGpNXLnrJPuFn3RsWliBR8kq6B5Dy3Py
X-Proofpoint-ORIG-GUID: bGpNXLnrJPuFn3RsWliBR8kq6B5Dy3Py
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_08,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1011 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020081
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WWXsm1Q4TWJ.A.6jZN.JINrmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3112
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ab363932-ab3d-49b1-853d-7313f02cce9e@linux.ibm.com
Resent-Date: Fri,  2 Aug 2024 12:33:13 +0000 (UTC)



On 8/2/24 14:39, Shinichiro Kawasaki wrote:
> 
> #3: nvme/052 (CKI failure)
> 
>    The CKI project reported that nvme/052 fails occasionally [4].
>    This needs further debug effort.
> 
>   nvme/052 (tr=loop) (Test file-ns creation/deletion under one subsystem) [failed]
>       runtime    ...  22.209s
>       --- tests/nvme/052.out	2024-07-30 18:38:29.041716566 -0400
>       +++ /mnt/tests/gitlab.com/redhat/centos-stream/tests/kernel/kernel-tests/-/archive/production/kernel-tests-production.zip/storage/blktests/nvme/nvme-loop/blktests/results/nodev_tr_loop/nvme/052.out.bad	2024-07-30 18:45:35.438067452 -0400
>       @@ -1,2 +1,4 @@
>        Running nvme/052
>       +cat: /sys/block/nvme1n2/uuid: No such file or directory
>       +cat: /sys/block/nvme1n2/uuid: No such file or directory
>        Test complete
> 
>    [4] https://datawarehouse.cki-project.org/kcidb/tests/13669275

I just checked the console logs of the nvme/052 and from the logs it's 
apparent that all namespaces were created successfully and so it's strange
to see that the test couldn't access "/sys/block/nvme1n2/uuid". Do you know
if there's any chance of simultaneous blktests running on this machine?
 
On my test machine, I couldn't reproduce this issue on 6.11-rc1 kernel.

Thanks,
--Nilay
 

