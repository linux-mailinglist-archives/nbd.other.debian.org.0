Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F742672C
	for <lists+nbd@lfdr.de>; Fri,  8 Oct 2021 11:50:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E83FB203B0; Fri,  8 Oct 2021 09:50:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  8 09:50:49 2021
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 95550202FC
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Oct 2021 09:50:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.912 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.03,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p4W1T61QCKAk for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Oct 2021 09:50:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id A42282030E
	for <nbd@other.debian.org>; Fri,  8 Oct 2021 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633686631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjDZx1fQKjNQlKZbBeD82QrB0Ihe+5TQzyp1JtFq7hY=;
	b=VgQ+BQbCJH4zhw+A5GsmGmzgI/gHPP86RjMibt3HGEqFHxqkmyFcvRvl6fJ6e+Z+K0QXGf
	sA0kBNq6ez0yU2FJyEKtKPPWJVEsWZ1IZt0Y+yP1MfAM3YlRrt8tZRKMNIlI/xsN36cL11
	atrFoxhBovpTxIVqmYOeoCqiIe+nV2Y=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-goLHe9XBPuKn91rftoyhUA-1; Fri, 08 Oct 2021 05:17:30 -0400
X-MC-Unique: goLHe9XBPuKn91rftoyhUA-1
Received: by mail-pg1-f199.google.com with SMTP id m14-20020a63fd4e000000b00287791fb324so1289758pgj.7
        for <nbd@other.debian.org>; Fri, 08 Oct 2021 02:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MjDZx1fQKjNQlKZbBeD82QrB0Ihe+5TQzyp1JtFq7hY=;
        b=kNBLnhg6242BOFQxNqhJB9x4SiryFOiPxEx8VRS8tKlX7wL/6CfYWucGOmqR+QjarM
         /uh1q9MAUYdUfRzbqj02v2IVB9niO4Kr8Wm5KgaJyORELVnWTaT8ui29gBo/0a6+tZnV
         QBq9msCkUmfqb0T6ea42BDYMlL/SotFtYUVg+UQ47447YRVDQ+Dc2G2G8v+01Pz2kcEc
         NaQBKVURbfGP16MMe78ibo01HfrOhO/o+FVFb8ynFuOQxeBq++P+Ha98W77H7BYIXYkb
         qoB/m4MJfSCj9nLlSX5de8VXpudmRkCF37JDc+nNCHS0Dy+GgbenoHq2wDwhXcGMaXFM
         lvEw==
X-Gm-Message-State: AOAM530VJxtAEDx7xPsAoZ8we86XbUh0Qqjcg7XKkScYs+Don+AxWErt
	nnOOeBMa3saEAZXxs6AZ/9lpMIVh7AGAbv4WHvNUOK4rKB7b4OkB0Ue+BQ9YWU4AVRzqxz+N3Cy
	3ls7ehghlGOq1Gg==
X-Received: by 2002:a63:f5b:: with SMTP id 27mr3647342pgp.302.1633684649705;
        Fri, 08 Oct 2021 02:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI5sORuIjy5pkP0wq4hXnm4U7ksEGByBSTpcKewsdRuT9q1hV4Sboi0B9e2oU0v3iuXloVFg==
X-Received: by 2002:a63:f5b:: with SMTP id 27mr3647317pgp.302.1633684649455;
        Fri, 08 Oct 2021 02:17:29 -0700 (PDT)
Received: from [10.72.12.176] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id lp9sm1953852pjb.35.2021.10.08.02.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 02:17:28 -0700 (PDT)
Subject: Re: nbd lifetimes fixes
To: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
References: <20210825163108.50713-1-hch@lst.de>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <a3d9e740-828a-6b4e-f1d6-b89fc905700c@redhat.com>
Date: Fri, 8 Oct 2021 17:17:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xiubli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MS8Ju2V7K3H.A.1FB.5RBYhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1538
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a3d9e740-828a-6b4e-f1d6-b89fc905700c@redhat.com
Resent-Date: Fri,  8 Oct 2021 09:50:49 +0000 (UTC)


On 8/26/21 12:31 AM, Christoph Hellwig wrote:
> Hi Josef and Jens,
>
> this series tries to deal with the fallout of the recent lock scope
> reduction as pointed out by Tetsuo and szybot and inspired by /
> reused from the catchall patch by Tetsuo.  One big change is that
> I finally decided to kill off the ->destroy_complete scheme entirely
> because I'm pretty sure it is not needed with the various fixes and
> we can just return an error for the tiny race condition where it
> matters.  Xiubo, can you double check this with your nbd-runner
> setup?  nbd-runner itself seems pretty generic and not directly
> reproduce anything here.
>
> Note that the syzbot reproduer still fails eventually, but in
> devtmpfsd in a way that does not look related to the loop code
> at all.
>
Sorry, I think I have missed this thread.

Test this and works well for me by using the nbd-runner.


