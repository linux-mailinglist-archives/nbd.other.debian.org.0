Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FC551773
	for <lists+nbd@lfdr.de>; Mon, 20 Jun 2022 13:30:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C51572045E; Mon, 20 Jun 2022 11:30:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 20 11:30:20 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=4.0 tests=MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,TO_TOO_MANY,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EFFC82045E
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Jun 2022 11:13:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.919 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BwglnSkdbmwd for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Jun 2022 11:13:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B37282044D
	for <nbd@other.debian.org>; Mon, 20 Jun 2022 11:13:02 +0000 (UTC)
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LRRlt2yjBz6H6lq;
	Mon, 20 Jun 2022 19:11:06 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Mon, 20 Jun 2022 13:12:58 +0200
Received: from [10.195.35.72] (10.195.35.72) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 20 Jun
 2022 12:12:57 +0100
Message-ID: <b98ad03b-e599-6023-3b34-ebefb590bf8c@huawei.com>
Date: Mon, 20 Jun 2022 12:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 5/5] blk-mq: Drop 'reserved' member of busy_tag_iter_fn
To: Bart Van Assche <bvanassche@acm.org>, <axboe@kernel.dk>,
	<damien.lemoal@opensource.wdc.com>, <hch@lst.de>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <hare@suse.de>, <satishkh@cisco.com>,
	<sebaddel@cisco.com>, <kartilak@cisco.com>
CC: <linux-rdma@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <mpi3mr-linuxdrv.pdl@broadcom.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
 <1655463320-241202-6-git-send-email-john.garry@huawei.com>
 <017cae1e-b45f-04fd-d34c-22ae736b28e5@acm.org>
 <a18fa379-5a9b-ff45-3be4-b253efd96a50@huawei.com>
 <c6a0eb8d-ad51-01b1-bc17-758acc37f216@acm.org>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <c6a0eb8d-ad51-01b1-bc17-758acc37f216@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.35.72]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gj-swWrWpaB.A.qZB.MpFsiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2169
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b98ad03b-e599-6023-3b34-ebefb590bf8c@huawei.com
Resent-Date: Mon, 20 Jun 2022 11:30:20 +0000 (UTC)

On 17/06/2022 17:55, Bart Van Assche wrote:
>>
>> It's not totally necessary. Since local variable 'reserved' would now 
>> only be used once I thought it was better to get rid of it.
>>
>> I can keep it if you really think that is better.
> 
> I'd prefer that these changes are either left out or that these are 
> moved into a separate patch. I think that will make this patch series 
> easier to review.

Personally I think that this is a trivial change and does not merit a 
separate patch. Other reviewers seem to agree. Anyway, if you feel 
strongly about this then I can put in another patch.

Thanks,
John

