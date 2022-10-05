Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 826045F58DB
	for <lists+nbd@lfdr.de>; Wed,  5 Oct 2022 19:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4E2612059A; Wed,  5 Oct 2022 17:12:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  5 17:12:13 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=4.0 tests=CC_TOO_MANY,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B71DC20594
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Oct 2022 16:54:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.221 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.743,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id va-HePz0OpPe for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Oct 2022 16:54:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pg1-f182.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BDCA5204D7
	for <nbd@other.debian.org>; Wed,  5 Oct 2022 16:54:22 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id j71so9581505pge.2
        for <nbd@other.debian.org>; Wed, 05 Oct 2022 09:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GFGmeXwzImdz1h+PmMN1s24FBEmejNYEC+q1xWfXEck=;
        b=bLJbVYwzBlzXBB+Ik++96BJrEU/vjuWw9CN1rs9T7Siv2TFdWQk1xOl4nvHZJfdyXA
         RYB3E1UaBNoHrT8gdz1iehStAkMSzm/U2QzpjyYQfVcZoLcb6uE5+ra13NPxPaX9aRQX
         MW9d/VbKSFgbZRAlwdwhuNY3wsQiySs0tWkeSIbZKvfFDIQnDNd3LpTWJvVDOmJ3FTHk
         Nm4or7zjj9EG2pkRb2UBAFsnb5k12TNN8oyz9Ez0HUMw7Rdgyu2leQqkV4Un/6dOosvl
         7q9QmFPLozUWBkBlV+HShDJO/ZdyVgKz5W53dXVWu0hrD6653eBP6HH2yvPgBtQ/kjqE
         rurQ==
X-Gm-Message-State: ACrzQf0TP/TlkHgTzg2qzgzF+tgh50OKOWVVTZlse8/acYR4QAwtooRU
	DZ4RZHYl6eCF8fTbYEPs5u0=
X-Google-Smtp-Source: AMsMyM5oX6qSPQ4HG3bu8E8hjU3lPQSUd8WrMcNcjR4MljBf6naYCl5wsAAwQMON9m5RMKfn4/SRMQ==
X-Received: by 2002:a62:2985:0:b0:544:77d4:f43b with SMTP id p127-20020a622985000000b0054477d4f43bmr726456pfp.9.1664988858370;
        Wed, 05 Oct 2022 09:54:18 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id j16-20020a170902da9000b00176c6738d13sm10795484plx.169.2022.10.05.09.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 09:54:17 -0700 (PDT)
Message-ID: <e0ea0b0a-5077-de37-046f-62902aca93b6@acm.org>
Date: Wed, 5 Oct 2022 09:54:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH 01/21] block: add and use init tagset helper
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, axboe@kernel.dk,
 efremov@linux.com, josef@toxicpanda.com, idryomov@gmail.com,
 dongsheng.yang@easystack.cn, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 stefanha@redhat.com, ohad@wizery.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, sth@linux.ibm.com,
 hoeppner@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, hare@suse.de,
 bhelgaas@google.com, john.garry@huawei.com, mcgrof@kernel.org,
 christophe.jaillet@wanadoo.fr, vaibhavgupta40@gmail.com,
 wsa+renesas@sang-engineering.com, johannes.thumshirn@wdc.com,
 ming.lei@redhat.com, shinichiro.kawasaki@wdc.com, vincent.fu@samsung.com,
 christoph.boehmwalder@linbit.com, joel@jms.id.au,
 vincent.whitchurch@axis.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 asahi@lists.linux.dev
References: <20221005032257.80681-1-kch@nvidia.com>
 <20221005032257.80681-2-kch@nvidia.com>
 <6fee2d7a-7fd1-73ee-2911-87a4ed3e8769@opensource.wdc.com>
 <CAPDyKFpBpiydQn+=24CqtaH_qa3tQfN2gQSiUrHCjnLSuy4=Kg@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAPDyKFpBpiydQn+=24CqtaH_qa3tQfN2gQSiUrHCjnLSuy4=Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zxtVoHnBwQC.A.ZoD.trbPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2232
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e0ea0b0a-5077-de37-046f-62902aca93b6@acm.org
Resent-Date: Wed,  5 Oct 2022 17:12:13 +0000 (UTC)

On 10/5/22 02:47, Ulf Hansson wrote:
> On Wed, 5 Oct 2022 at 07:11, Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
>> On 10/5/22 12:22, Chaitanya Kulkarni wrote:
>>> +void blk_mq_init_tag_set(struct blk_mq_tag_set *set,
>>> +             const struct blk_mq_ops *ops, unsigned int nr_hw_queues,
>>> +             unsigned int queue_depth, unsigned int cmd_size, int numa_node,
>>> +             unsigned int timeout, unsigned int flags, void *driver_data)
>>
>> That is an awful lot of arguments... I would be tempted to say pack all
>> these into a struct but then that would kind of negate this patchset goal.
>> Using a function with that many arguments will be error prone, and hard to
>> review... Not a fan.
> 
> I completely agree.
> 
> But there is also another problem going down this route. If/when we
> realize that there is another parameter needed in the blk_mq_tag_set.
> Today that's quite easy to add (assuming the parameter can be
> optional), without changing the blk_mq_init_tag_set() interface.

Hi Chaitanya,

Please consider to drop the entire patch series. In addition to the 
disadvantages mentioned above I'd like to mention the following 
disadvantages:
* Replacing named member assignments with positional arguments in a
   function call makes code harder to read and harder to verify.
* This patch series makes tree-wide changes without improving the code
   in a substantial way.

Thanks,

Bart.

