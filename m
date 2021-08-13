Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6323EB9B5
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 18:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8540420414; Fri, 13 Aug 2021 16:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 16:03:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A610F2041F
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 15:45:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t1BtHsJB7BVo for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 15:45:11 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf34.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C0E6F203FF
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 15:45:11 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id dk2so5449619qvb.3
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B9++UQjluYFHNVHpmQPx1jgqFcnRfQdNLC3YQP9GS7Q=;
        b=pKtoEC6bxELQk/aJyT64Up3tnNBPYcWkLLIvJ7A1sujHclj2FFZpimAIv/QzdlAR+l
         g21eYJ8Bg+7IflnlejX8/YVlYXsJil24EiN4v+5WCVxuUhogCZkdpw4At4zMS+3aKxBn
         uzffAW+HYXtCKI0KIwbDJDK89xd3yQqSttYtWGSVTrPBo1iaAguLhnv0wlmM7aYJlQkq
         FI/l6dFCKPyThFrGTstVPDPTl8TJ8TK/e0JrxqEdrcZ+4u2tvl7BQQ/PI4mD7wkbKFOq
         dmE8D2shm2kcuiDvD7LgHdmKBq/6Z5rPd6RFPEp0wscI/7cgCItEZSDraOfJbzyilIYg
         e//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B9++UQjluYFHNVHpmQPx1jgqFcnRfQdNLC3YQP9GS7Q=;
        b=g99m9+CcndNodhyDy+ArC1Y+brXNZje7KpsHC2mrX2k+yNFMqkWkNA1BB1d50oI9p/
         zQBxQ1jAkteTCvmrDSpfH/HNJkKEApdW67rZodYQMuGvBDSScDQ3Q8ak+6SdnFoaRrZi
         4/dFGHXD1ZPzgagq4UpX6cwBt4G9B6TMZBbG8EeyYco3+1k9W9OpVmUx2DZcdsBPfKrG
         cjm0dr/TXZwvP8mxW54g3lRYxVr206bIR7x6n8+xT3/QEF5MDL+CqIo/TUwz2CoYfazk
         JLEqGoKiIVCqSyl4xGWXzQFY+BFUMoes3RJfHPHopQYw+WF7Z3UuUdJryBAib5xTT103
         jigQ==
X-Gm-Message-State: AOAM532XwDmW2rIsLn8bGV8yTaNK49yp91irTJwFkZGYSYko3qaIxMeC
	YampKdh5dGpBeaGqSqcL07AUnAwu40ZYsw==
X-Google-Smtp-Source: ABdhPJx9RQY6Th0CkE5I3ByN04Wqooir3FdeHuj6MJzRj/u0jEm2CJDN2VDhOSanExV4MT47kFMfBQ==
X-Received: by 2002:a05:6214:e62:: with SMTP id jz2mr3280396qvb.21.1628869506897;
        Fri, 13 Aug 2021 08:45:06 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id f17sm1065682qkm.107.2021.08.13.08.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 08:45:06 -0700 (PDT)
Subject: Re: [PATCH RESEND] nbd: Aovid double completion of a request
To: Xie Yongji <xieyongji@bytedance.com>, axboe@kernel.dk
Cc: jiangyadong@bytedance.com, linux-block@vger.kernel.org,
 nbd@other.debian.org
References: <20210813151330.96-1-xieyongji@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <10f5ac3e-4420-2635-1edc-7beca28e9619@toxicpanda.com>
Date: Fri, 13 Aug 2021 11:45:04 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210813151330.96-1-xieyongji@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CEuvtssSNbB.A.DYC.9epFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1284
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/10f5ac3e-4420-2635-1edc-7beca28e9619@toxicpanda.com
Resent-Date: Fri, 13 Aug 2021 16:03:09 +0000 (UTC)

On 8/13/21 11:13 AM, Xie Yongji wrote:
> There is a race between iterating over requests in
> nbd_clear_que() and completing requests in recv_work(),
> which can lead to double completion of a request.
> 
> To fix it, flush the recv worker before iterating over
> the requests and don't abort the completed request
> while iterating.
> 
> Fixes: 96d97e17828f ("nbd: clear_sock on netlink disconnect")
> Reported-by: Jiang Yadong <jiangyadong@bytedance.com>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Thanks for resending this, my email client messed up.

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Josef

