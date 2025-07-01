Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E83DDAEFB0D
	for <lists+nbd@lfdr.de>; Tue,  1 Jul 2025 15:45:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 52348204B2; Tue,  1 Jul 2025 13:45:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  1 13:45:14 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE1D42046E
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Jul 2025 13:29:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.704 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, CC_TOO_MANY=3, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6mJFlXrNtmWr for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Jul 2025 13:29:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2D9292046C
	for <nbd@other.debian.org>; Tue,  1 Jul 2025 13:29:34 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5617SAS9015530;
	Tue, 1 Jul 2025 13:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R2LPfz
	ZAhQe7cHlRN4Vh8kEZO2c2/KR4YiDcTRwdZUc=; b=phtXADyMYOB8MP3XxHilai
	ksftbRLlNU4f0nUI2CRYTYVM4qt5a+BeWTSZwxzJwbL6axIfrg8HjwK6mTcdmAwW
	PGQ2exB6gMS4EPGZ3YfgsmIiZeYw1auHVQ01mcskFWIQemP/JUv7MHc6JR7KM1Vp
	bxjeqVcVwLYQX5c5WAZb1Tvb98ku5uU/nsYff9+HfxYhVwDWEtW1J62iYIF2+t6m
	TNAsT/DjXKsK906HvyI59j212s6BMRgJf1muEoH0xhFNq/Ftnr36X07vkvGjpkJX
	DG9nP0xvjT3STtlQwq6X9RUb0zh8C0tiLgUWmgzAA/cRW0EarXfh96IguD96ufNg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82fq9ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:29:05 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5619GLLp021354;
	Tue, 1 Jul 2025 13:29:04 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3ag45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:29:04 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 561DT3xS47251836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jul 2025 13:29:04 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D90A058053;
	Tue,  1 Jul 2025 13:29:03 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7560458043;
	Tue,  1 Jul 2025 13:28:59 +0000 (GMT)
Received: from [9.109.198.197] (unknown [9.109.198.197])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Jul 2025 13:28:59 +0000 (GMT)
Message-ID: <197b6dca-56be-438d-a60f-21011367c5ed@linux.ibm.com>
Date: Tue, 1 Jul 2025 18:58:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: fix false lockdep deadlock warning
To: Yu Kuai <yukuai1@huaweicloud.com>, Ming Lei <ming.lei@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org, hare@suse.de,
        linux-block@vger.kernel.org, nbd@other.debian.org,
        linux-kernel@vger.kernel.org, yi.zhang@huawei.com,
        yangerkun@huawei.com, johnny.chenyi@huawei.com,
        "yukuai (C)" <yukuai3@huawei.com>
References: <20250627092348.1527323-1-yukuai1@huaweicloud.com>
 <aF56oVEzTygIOUTN@fedora>
 <c2fbaacc-62a1-4a98-4157-2637b7f242b7@huaweicloud.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <c2fbaacc-62a1-4a98-4157-2637b7f242b7@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3za37TQSPbaaUSTfUtjGnyRhsq__BLbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NSBTYWx0ZWRfX14L1sdyPs4d4 CCRPJ8ybBPD9qm0yx6zbRHSoDlY4ChNEdVZtxH74YFPdFOBnxiWXbVE5LtQLSEn7SvcqlFdeAmB yCsVNcKd+rtyQKc17m8/0NCkf+ifbxyFL07rpo2daQ9+Ij+y3rZjyZLvdDKHn0zubeURMIi5PQ1
 sjsV3talSyqjadgCCec+G+YGdCvfO4d9XxRmzdEkLnEpfM7jS4JDAq6pdoRpRyy7Vdecxo6HtJa h5Wbuus2OmCnnWt8vpqmwuDsOa2C4AaBWSO4jSTyLyY88ABpxQqgQZ6ZwajKhmeOx8O/8ffKlbr OxslmHDt00qkxqaBSVp+QPERINjLbo36r3nP06zjlzU1uAwDp/3S9Avd4SX3suRBTjXHYF/QEVy
 +mwpD6pebM1+xSZFO/izk3kRT+48c2S/30/tulfCBM2Q2CoKgE1cswdgRdtK3pb4Rdft/hRn
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6863e2a1 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=VxcEa7Whk2O1MWBbjpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3za37TQSPbaaUSTfUtjGnyRhsq__BLbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010085
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VTWv-GHFxZL.A.TJ6D.qZ-YoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3398
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/197b6dca-56be-438d-a60f-21011367c5ed@linux.ibm.com
Resent-Date: Tue,  1 Jul 2025 13:45:14 +0000 (UTC)



On 6/28/25 6:18 AM, Yu Kuai wrote:
> Hi,
> 
> 在 2025/06/27 19:04, Ming Lei 写道:
>> I guess the patch in the following link may be simper, both two take
>> similar approach:
>>
>> https://lore.kernel.org/linux-block/aFjbavzLAFO0Q7n1@fedora/
> 
> I this the above approach has concurrent problems if nbd_start_device
> concurrent with nbd_start_device:
> 
> t1:
> nbd_start_device
> lock
> num_connections = 1
> unlock
>     t2:
>     nbd_add_socket
>     lock
>     config->num_connections++
>     unlock
>         t3:
>         nbd_start_device
>         lock
>         num_connections = 2
>         unlock
>         blk_mq_update_nr_hw_queues
> 
> blk_mq_update_nr_hw_queues
> //nr_hw_queues updated to 1 before failure
> return -EINVAL
> 

In the above case, yes I see that t1 would return -EINVAL (as 
config->num_connections doesn't match with num_connections)
but then t3 would succeed to update nr_hw_queue (as both 
config->num_connections and num_connections set to 2 this 
time). Isn't it? If yes, then the above patch (from Ming)
seems good. 

Thanks,
--Nilay

