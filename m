Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE27AFC20C
	for <lists+nbd@lfdr.de>; Tue,  8 Jul 2025 07:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 241A820577; Tue,  8 Jul 2025 05:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  8 05:33:13 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C2DAC20573
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Jul 2025 05:17:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.804 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, CC_TOO_MANY=3, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aWMj5WmjG1px for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Jul 2025 05:17:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 782F920572
	for <nbd@other.debian.org>; Tue,  8 Jul 2025 05:17:46 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56801JGM022666;
	Tue, 8 Jul 2025 05:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YIo1q4
	dd0RPsvXkyj654gELeQyNh3xOur1uKto2yx+w=; b=I09U4vSnqXfajrjhkj/4Lb
	KcEdl3iqFJwYqxWWW5nlTMHY8VbZitx23nmc69vxZCrXfnwF5tQdiSscy0URvlZP
	6rkc0eV44CPgWWwJFsLKmglCB3ukIQ0zGnJopydBK0KDf+TWRhielauHicqxacMk
	UJDxnCxQdao+8aWfbZ/yccWyfKJUAv8Ppez6PpCE2rqoLsoBd8cH+8N2+ZzxbZcq
	32nm2HPq1n4rEjSE5BB6IBNElub+AuPyEdWumYS8yynK1PNFJ8rR250oXdbUQ1fa
	vv2RggNuUM6k4iC7c928TuP6JQEOG9VlqPaX+VR4ikkbXCIX2Br18NIsOnTnQuEA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptfyn6j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 05:12:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5681FVAe010841;
	Tue, 8 Jul 2025 05:12:07 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qes01hk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 05:12:07 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5685C6AV31457798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jul 2025 05:12:06 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5411758056;
	Tue,  8 Jul 2025 05:12:06 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B09558052;
	Tue,  8 Jul 2025 05:12:02 +0000 (GMT)
Received: from [9.109.244.163] (unknown [9.109.244.163])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Jul 2025 05:12:01 +0000 (GMT)
Message-ID: <91174432-8c70-437f-811f-7c8a6c028f64@linux.ibm.com>
Date: Tue, 8 Jul 2025 10:42:00 +0530
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
 <197b6dca-56be-438d-a60f-21011367c5ed@linux.ibm.com>
 <99b4afce-de05-ddcb-2634-b19214cf4534@huaweicloud.com>
 <aGSaVhiH2DeTvtdr@fedora>
 <7b09167f-bf8d-4d94-9317-3cfbb4f83cd8@linux.ibm.com>
 <bc3f20c3-21f8-443b-619f-da7569b37aaf@huaweicloud.com>
 <08ce91d9-756a-a8fa-a988-a13ec74d8c1c@huaweicloud.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <08ce91d9-756a-a8fa-a988-a13ec74d8c1c@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=crubk04i c=1 sm=1 tr=0 ts=686ca8a7 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=tZyX4RX2Dpwam7ClYu8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SARxAeRUtbsx8cT6B8GZwT_V5ryi8NZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAzMSBTYWx0ZWRfX4fID3x1Nn7ZK VcSNPe6sZZjRnRGVa5wnb/+vWgSV38LR7kkYnARo2gG75zGtMB5HKfYG+fMxDLRtqJA5Ti+yTi3 ixPErlLyAg0+PfnDGX1h9iMTL+QES7X3n/s2+F+YFkmcnkw6mcCONZSaqia33gsehcIM6ioo4wt
 rnYwmoQ09vZK0LWf5PyWINEPwdX4L2VRQkKTqDhIosvrr3r8yLyG9vl4rrH6b8tQgdvT+X1efLZ Hnek1ew0FVfLgBbguPfFi+2OnCy00wxIXcX/1thHLMPlHwRVv89l5JI1GQfAD9H60+FA3kP74SO 9UJdz0rGXT9FSfMqyEERVazCNJhPVaFXES162/HnVAYdy00f2wURbmK2F81EhXg7T8hAkokJ7jY
 DPK3AX3VyoQ1rI+HW9rgtSA6FoW52mKwErNbgIRIAydlHdRyTpE+Zv8sHAkwoVzvOdq+qr/p
X-Proofpoint-GUID: SARxAeRUtbsx8cT6B8GZwT_V5ryi8NZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080031
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZdO_LscM4UK.A.WhsH.Z2KboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3413
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/91174432-8c70-437f-811f-7c8a6c028f64@linux.ibm.com
Resent-Date: Tue,  8 Jul 2025 05:33:13 +0000 (UTC)



On 7/5/25 6:45 AM, Yu Kuai wrote:
> Hi,
> 
> 在 2025/07/02 15:30, Yu Kuai 写道:
>> Hi,
>>
>> 在 2025/07/02 14:22, Nilay Shroff 写道:
>>>
>>>
>>> On 7/2/25 8:02 AM, Ming Lei wrote:
>>>> On Wed, Jul 02, 2025 at 09:12:09AM +0800, Yu Kuai wrote:
>>>>> Hi,
>>>>>
>>>>> 在 2025/07/01 21:28, Nilay Shroff 写道:
>>>>>>
>>>>>>
>>>>>> On 6/28/25 6:18 AM, Yu Kuai wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> 在 2025/06/27 19:04, Ming Lei 写道:
>>>>>>>> I guess the patch in the following link may be simper, both two take
>>>>>>>> similar approach:
>>>>>>>>
>>>>>>>> https://lore.kernel.org/linux-block/aFjbavzLAFO0Q7n1@fedora/
>>>>>>>
>>>>>>> I this the above approach has concurrent problems if nbd_start_device
>>>>>>> concurrent with nbd_start_device:
>>>>>>>
>>>>>>> t1:
>>>>>>> nbd_start_device
>>>>>>> lock
>>>>>>> num_connections = 1
>>>>>>> unlock
>>>>>>>       t2:
>>>>>>>       nbd_add_socket
>>>>>>>       lock
>>>>>>>       config->num_connections++
>>>>>>>       unlock
>>>>>>>           t3:
>>>>>>>           nbd_start_device
>>>>>>>           lock
>>>>>>>           num_connections = 2
>>>>>>>           unlock
>>>>>>>           blk_mq_update_nr_hw_queues
>>>>>>>
>>>>>>> blk_mq_update_nr_hw_queues
>>>>>>> //nr_hw_queues updated to 1 before failure
>>>>>>> return -EINVAL
>>>>>>>
>>>>>>
>>>>>> In the above case, yes I see that t1 would return -EINVAL (as
>>>>>> config->num_connections doesn't match with num_connections)
>>>>>> but then t3 would succeed to update nr_hw_queue (as both
>>>>>> config->num_connections and num_connections set to 2 this
>>>>>> time). Isn't it? If yes, then the above patch (from Ming)
>>>>>> seems good.
>>>>>
>>>>> Emm, I'm confused, If you agree with the concurrent process, then
>>>>> t3 update nr_hw_queues to 2 first and return sucess, later t1 update
>>>>> nr_hw_queues back to 1 and return failure.
>>>>
>>>> It should be easy to avoid failure by simple retrying.
>>>>
>>> Yeah I think retry should be a safe bet here.
>>>
>>
>> I really not sure about the retry, the above is just a scenario that I
>> think of with a quick review, and there are still many concurrent
>> scenarios that need to be checked, I'm kind of lost here.
>>
>> Except nbd_start_device() and nbd_add_socked(), I'm not confident
>> other context that is synchronized with config_lock is not broken.
>> However, I'm ok with the bet.
>>
>>> On another note, synchronizing nbd_start_device and nbd_add_socket
>>> using nbd->task_setup looks more complex and rather we may use
>>> nbd->pid to synchronize both. We need to move setting of nbd->pid
>>> before we invoke blk_mq_update_nr_hw_queues in nbd_start_device.
>>> Then in nbd_add_socket we can evaluate nbd->pid and if it's
>>> non-NULL then we could assume that either nr_hw_queues update is in
>>> progress or device has been setup and so return -EBUSY. I think
>>> anyways updating number of connections once device is configured
>>> would not be possible, so once nbd_start_device is initiated, we
>>> shall prevent user adding more connections. If we follow this
>>> approach then IMO we don't need to add retry discussed above.
>>
>> It's ok for me to forbit nbd_add_socked after nbd is configured, there
>> is nowhere to use the added sock. And if there really are other contexts
>> need to be synchronized, I think nbd->pid can be used as well.
>>
> 
> Do we have a conclusion now? Feel free to send the retry version, or let
> me know if I should send a new synchronize version.
> 
Personally, I prefer synchronizing nbd_start_device and nbd_add_socket
using nbd->pid but I do agree retry version would also work. Having
said that, lets wait for Ming's feedback as well.

Thanks,
--Nilay

