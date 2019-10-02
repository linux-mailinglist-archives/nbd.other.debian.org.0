Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4386BC898D
	for <lists+nbd@lfdr.de>; Wed,  2 Oct 2019 15:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D57082039D; Wed,  2 Oct 2019 13:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  2 13:27:08 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 708132039C
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Oct 2019 13:09:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id N0IoS8mXZ1pw for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Oct 2019 13:09:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd41.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8CACC20414
	for <nbd@other.debian.org>; Wed,  2 Oct 2019 13:09:33 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q10so56786236iop.2
        for <nbd@other.debian.org>; Wed, 02 Oct 2019 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=LGBRuLqUYrX9GGEZI9KKoyUAhJq9ZXxDsRWTIcZfJKs=;
        b=rivVgCttX729kcL32gPJi94oiGeS/ifekn7WfKH0+689qAHuwZ9GMA8DoZ3c1HyAR/
         hLXUYrXvu/gAXPTX4iddYvXTTqa4Clmf9rHuwEC5ng0E4lqdeTmrusQ/3rMg9Hl8tJ66
         T/m4Lsd230UKL4EoovEAS51KnE/io9py1nKfWosvvFoE9iykZLeRcp4WbIiPCEXcoAaM
         BSq09rThM9NHC2ODOBVwG3W/Dl7wBBGv/xnvIoC4NIAcf4Ld3PmW3sXbRdGHT3rKj+CD
         3QwI4qifLJc1emxI5N20ihafo6GqeuuARQ7FOLsRk9ryt9v0nRr/G404yZpHtpR9ECkF
         XYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LGBRuLqUYrX9GGEZI9KKoyUAhJq9ZXxDsRWTIcZfJKs=;
        b=CKKJmrKhk4no+xPthgddNKzsnRqdYbg7S8AlbC8lYF1DQSORB6/+KosWlfGOpbgp4X
         KYSlYYoMd8FdSBbku3nEUi6ebC+ET5JSlXFn79Ouog96ivD3VmaZUqdeBBRXBDh0s+fb
         PTXpQe+oiofC3UA+48bEg7UuZ7EzE79xm0Hp2ztDLCyWcUuuX1dYE8zyDinUAdn3liXT
         ciefLui/uwvw++e7yrXYelVb3o4r9vIHqZ0QXANp/2h71D8KMlXwZlMlsTHEYZrJPl14
         L0LXRdYumXjhUwocjBNEmbKwtL3JPIsw+EG8+FouiaLiTLcm7II16k2hBot1BLGYErCk
         r70w==
X-Gm-Message-State: APjAAAW/ooBvhHrQE3MbqPMQgbe9/sa09dK0pOsbIMKpuLQGg3Xob3FJ
	sd1bbdUvFozhb27KrgksmcdSeA==
X-Google-Smtp-Source: APXvYqxoOv3gPtGv+2gVmJxtYhhJTGAOSpJ5159QObAXDK3v9RjA9LkKGLL73o5+qLKCvndxIogJsA==
X-Received: by 2002:a5e:8341:: with SMTP id y1mr2926558iom.284.1570021769994;
        Wed, 02 Oct 2019 06:09:29 -0700 (PDT)
Received: from [192.168.1.50] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id c4sm7265663ilh.32.2019.10.02.06.09.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 06:09:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] blk-mq: Inline request status checkers
To: Pavel Begunkov <asml.silence@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>, Josef Bacik <josef@toxicpanda.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 linux-nvme@lists.infradead.org
References: <1cd320dad54bd78cb6721f7fe8dd2e197b9fbfa2.1569830796.git.asml.silence@gmail.com>
 <e6fc239412811140c83de906b75689530661f65d.1569872122.git.asml.silence@gmail.com>
 <e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org>
 <6da099e2-7e29-3c7b-7682-df86835e9e8c@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e4fb245a-5587-866b-8bfa-927d0fb0801b@kernel.dk>
Date: Wed, 2 Oct 2019 07:09:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6da099e2-7e29-3c7b-7682-df86835e9e8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ekha6LrgUHO.A.-AG.sWKldB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/704
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e4fb245a-5587-866b-8bfa-927d0fb0801b@kernel.dk
Resent-Date: Wed,  2 Oct 2019 13:27:08 +0000 (UTC)

On 9/30/19 2:12 PM, Pavel Begunkov wrote:
> On 30/09/2019 22:53, Bart Van Assche wrote:
>> On 9/30/19 12:43 PM, Pavel Begunkov (Silence) wrote:
>>> @@ -282,7 +282,7 @@ static bool bt_tags_iter(struct sbitmap *bitmap, unsigned int bitnr, void *data)
>>>   	 * test and set the bit before assining ->rqs[].
>>>   	 */
>>>   	rq = tags->rqs[bitnr];
>>> -	if (rq && blk_mq_request_started(rq))
>>> +	if (rq && blk_mq_rq_state(rq) != MQ_RQ_IDLE)
>>>   		return iter_data->fn(rq, iter_data->data, reserved);
>>>   
>>>   	return true>
>>> @@ -360,7 +360,7 @@ static bool blk_mq_tagset_count_completed_rqs(struct request *rq,
>>>   {
>>>   	unsigned *count = data;
>>>   
>>> -	if (blk_mq_request_completed(rq))
>>> +	if (blk_mq_rq_state(rq) == MQ_RQ_COMPLETE)
>>>   		(*count)++;
>>>   	return true;
>>>   }
>>
>> Changes like the above significantly reduce readability of the code in
>> the block layer core. I don't like this. I think this patch is a step
>> backwards instead of a step forwards.
> 
> Yep, looks too bulky.
> 
> Jens, could you consider the first version?

Yes, first one is fine, I have applied it. Thanks.

-- 
Jens Axboe

