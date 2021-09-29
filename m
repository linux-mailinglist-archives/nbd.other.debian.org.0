Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C441CD80
	for <lists+nbd@lfdr.de>; Wed, 29 Sep 2021 22:39:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B9140207A5; Wed, 29 Sep 2021 20:39:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 29 20:39:42 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A5CE0207B6
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 Sep 2021 20:19:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.03,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q3hFkTluVd77 for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 Sep 2021 20:19:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x832.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3280B207B1
	for <nbd@other.debian.org>; Wed, 29 Sep 2021 20:19:14 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id r1so3506168qta.12
        for <nbd@other.debian.org>; Wed, 29 Sep 2021 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=02EXaRR/LNadeGaGEAJYu9eu7Tm3d0AkQIYMMcAXP4c=;
        b=LE4/GyFbg6PDYrFzMabU3wOkVWt1bHu/gEgjJL5r//rlKzDS9g6ZiNQZLgEqE5952C
         dhL0UwiqvNKYDPPQwubbwnqD9mpLnpOEj3bv8j2jO1T9MAE3sZYwQ6v4I0zIsPKYyZ4O
         rdmxyzL/WT5dtPbI02l1h0ZBCIiueWXex102uRrAV0withKV6ROlvuDYxJP2cXQYBS2P
         MiqX0CMENIKK+QG5J5hg8kAfOm4AOlfDXgGFEFmsQPmHc89hK9HHWbd0922OIa0ky0DK
         +koVjJRzBZVdI1lt+yaJcdYnUZs9aEE637ZhmjvS56wbP/NlDDSnzSlUs5LBT01p5N49
         lXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=02EXaRR/LNadeGaGEAJYu9eu7Tm3d0AkQIYMMcAXP4c=;
        b=RIzCsK+b2a3W40r4O06Bq79F59VE5KcqjN0qRAybTtV3tkF+9ct3xFMPi+90r1zjA2
         20MUe/Xy5wguEp7EbBB5dVSYjMrSbspS9jHVwgahdgoCK2ynEhhn5OTFnR3uizRfcHME
         Id8Jy3geQbZ09VCSeUF+ZtdBDBRzUyq7sy9E103GG8RqojOs6jHy6EN3w8h4C/Jrhzm5
         F3O6E+rY528bNEzCINo/yJpv7je3WTIZkKyORE25IavnbSPKCC6UbqkVqL2drYzgGN/b
         DTq37IO4d76Z+YfvUaOqW1/2xh8qOxdxeMGzwguLOjGTm6OOnTEYqMM8oXcSDmxY7SdG
         muGA==
X-Gm-Message-State: AOAM532k+hdCY20htZm6wLHIuP2UuaupK6RFAK+3WsAmq9caDX+Wv3Kr
	SQXRmQmA1Oc/O968pv5dv/p9Mg==
X-Google-Smtp-Source: ABdhPJwtTleKCd4n65jPyiBJ5xy5JKPI3hEe5Ya8CJPORXD/cexXVJrGJWxaT2KgbAuRKQXmDeCx3Q==
X-Received: by 2002:ac8:4243:: with SMTP id r3mr2223327qtm.187.1632946751266;
        Wed, 29 Sep 2021 13:19:11 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id z10sm485338qtv.6.2021.09.29.13.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 13:19:10 -0700 (PDT)
Subject: Re: [PATCH] nbd: use shifts rather than multiplies
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Pavel Machek <pavel@ucw.cz>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20210920232533.4092046-1-ndesaulniers@google.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <079a17e7-6cf1-7632-bf12-1df0edf4f93a@toxicpanda.com>
Date: Wed, 29 Sep 2021 16:19:09 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210920232533.4092046-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UPDGjlNgDnE.A.geC.O8MVhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1534
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/079a17e7-6cf1-7632-bf12-1df0edf4f93a@toxicpanda.com
Resent-Date: Wed, 29 Sep 2021 20:39:42 +0000 (UTC)

On 9/20/21 7:25 PM, Nick Desaulniers wrote:
> commit fad7cd3310db ("nbd: add the check to prevent overflow in
> __nbd_ioctl()") raised an issue from the fallback helpers added in
> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and
> add fallback code")
> 
> ERROR: modpost: "__divdi3" [drivers/block/nbd.ko] undefined!
> 
> As Stephen Rothwell notes:
>    The added check_mul_overflow() call is being passed 64 bit values.
>    COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW is not set for this build (see
>    include/linux/overflow.h).
> 
> Specifically, the helpers for checking whether the results of a
> multiplication overflowed (__unsigned_mul_overflow,
> __signed_add_overflow) use the division operator when
> !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW.  This is problematic for 64b
> operands on 32b hosts.
> 
> This was fixed upstream by
> commit 76ae847497bc ("Documentation: raise minimum supported version of
> GCC to 5.1")
> which is not suitable to be backported to stable.
> 
> Further, __builtin_mul_overflow() would emit a libcall to a
> compiler-rt-only symbol when compiling with clang < 14 for 32b targets.
> 
> ld.lld: error: undefined symbol: __mulodi4
> 
> In order to keep stable buildable with GCC 4.9 and clang < 14, modify
> struct nbd_config to instead track the number of bits of the block size;
> reconstructing the block size using runtime checked shifts that are not
> problematic for those compilers and in a ways that can be backported to
> stable.
> 
> In nbd_set_size, we do validate that the value of blksize must be a
> power of two (POT) and is in the range of [512, PAGE_SIZE] (both
> inclusive).
> 
> This does modify the debugfs interface.
> 
> Cc: stable@vger.kernel.org
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1438
> Link: https://lore.kernel.org/all/20210909182525.372ee687@canb.auug.org.au/
> Link: https://lore.kernel.org/stable/CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

