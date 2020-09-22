Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F56227432F
	for <lists+nbd@lfdr.de>; Tue, 22 Sep 2020 15:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 06C162047F; Tue, 22 Sep 2020 13:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 22 13:33:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E8C7204C5
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Sep 2020 13:17:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oGr1zhuOy9v0 for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Sep 2020 13:17:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf41.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E1AAF204C1
	for <nbd@other.debian.org>; Tue, 22 Sep 2020 13:17:21 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id j3so9438353qvi.7
        for <nbd@other.debian.org>; Tue, 22 Sep 2020 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y7hBRDL7D6Os8jd/ujBfUgL9LgsIqC36Ea7y4QNnNwA=;
        b=yy2bl6Hywwn6atQQyV2G+5KhajzE8adC57JKYyO5qlSR6pM4IYuB6FZgr2Ll4TJsc2
         W0IPwRUfm18BUiFxMnTFwVqlAIbQNnsYVndZDjuF/qzpIkNARg/hFwRvEW4xHWSAi058
         hWFfJwDgGgLG+OgdXgib5RqvCUseRQ1wZFD7ZdXE7i3TcvZMVRIBF/zqQbwZS6I4aua4
         3wILroqhMyw8qSTVsuCJcKBYAdMZQLWgksgRCimFzC7XavG72jEKYh+laBjdkBEh7YrQ
         Oq3GuCIj2vHWE59D1ZdZn5dzWhZ0pOl42QuDbJqKrVuFn5riMVzt016oIyUFLSJApNHT
         yTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y7hBRDL7D6Os8jd/ujBfUgL9LgsIqC36Ea7y4QNnNwA=;
        b=gaA33ye8C9y7PXZ+2+TaBMw4e2u+QAaaO2G3mmKH0jD8zSOd8ppPTFA/RkzlmBriGb
         xEjlx2kswdcjB+tTWD2kH8Dmy7cizthdn3GH4E5uuzcjMKKkIFEKFWKx4xTvJB5CTyDb
         Oq8Gj1FAl1lWEcVpwlwU040QXvKVsBLwCI/K72tfPFichtedNpD61BsCXjRsWv6aj4AD
         80tqrzv7LmtJQPmcXoptqyUbbXdfFGULWH07cSYbtOjSGVb5rl4D2oMZ6TmTmnfOlYnw
         rkPH2t1AQzw85Tpyw9eOloSlt9p074aTdBjsFLiBMRkTJXlZXtJZ2lLg/DTIHdrrYMQS
         lSQA==
X-Gm-Message-State: AOAM533xdR1FsDV05zGzyq4d1fyuqiAS3VwQ9X4Kjxz0pT1segNhx8Si
	v1nyRDJ9+UYFWXg8EBaUez2hoN3i442KTKk2
X-Google-Smtp-Source: ABdhPJwZakf/ID6zTVvXKm89xV38c1oiFCba0j711DtvgOMif1ocu0KVL2Pz9lwN8fy6w9TlPobDsQ==
X-Received: by 2002:a0c:a95e:: with SMTP id z30mr5836737qva.58.1600780638198;
        Tue, 22 Sep 2020 06:17:18 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id f76sm11133910qke.19.2020.09.22.06.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 06:17:17 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] nbd: introduce a client flag to do zero timeout
 handling
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200922033457.46227-1-houpu@bytedance.com>
 <20200922033457.46227-3-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <4a81b066-86d2-8532-f540-31ef9830e26b@toxicpanda.com>
Date: Tue, 22 Sep 2020 09:17:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200922033457.46227-3-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zaEXh4vF2TD.A.PxH.U0fafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1002
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4a81b066-86d2-8532-f540-31ef9830e26b@toxicpanda.com
Resent-Date: Tue, 22 Sep 2020 13:33:09 +0000 (UTC)

On 9/21/20 11:34 PM, Hou Pu wrote:
> Introduce a dedicated client flag NBD_RT_WAIT_ON_TIMEOUT to reset
> timer in nbd_xmit_timer instead of depending on tag_set.timeout == 0.
> So that the timeout value could be configured by the user to
> whatever they like instead of the default 30s. A smaller timeout
> value allow us to detect if a new socket is reconfigured in a
> shorter time. Thus the io could be requeued more quickly.
> 
> In multiple sockets configuration, the user could also disable
> dropping the socket in timeout by setting this flag.
> 
> The tag_set.timeout == 0 setting still works like before.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

