Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1141D19D
	for <lists+nbd@lfdr.de>; Thu, 30 Sep 2021 04:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 303FD20812; Thu, 30 Sep 2021 02:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 30 02:48:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 28EC120817
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 Sep 2021 02:32:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.03,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1rp-topAOsT9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 Sep 2021 02:32:13 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd30.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3683D20812
	for <nbd@other.debian.org>; Thu, 30 Sep 2021 02:32:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z184so5696081iof.5
        for <nbd@other.debian.org>; Wed, 29 Sep 2021 19:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C3icfHV8rziphpmZsPVo5VvYUU+r4uhS/fnY11daDVU=;
        b=BsTyfe3MEXlmmuEqY2A0DBWVcv0KQjH3UQvRb8ylvQxdS36BVtLsKP0cgaKrxAidUp
         DlMFioCBU5rx+XarWdBaMaDbdQNQ+ory9j1MY1WTUqtUfzI+hAX2JqKgATC3HqLy8eIe
         565U9RN9A5bOj+Jxy+QoPe8STtb0kcULmBDw+Nxi64SivK9o6Os3cEUQZEUnJUq3Nef5
         kstwOVz7C1xHXkJjnnydbcySksgU1F11XpF3l/P0YDgVoC/dNFh+ZRdhk6JnP5gm9dwA
         GLC+SmvjYAXoNlpFnBm3p5D1xIu1Ei9qoaJEHAT0H7AMGrlQEiOa0G+/bjDdQ5VS79Fu
         WBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C3icfHV8rziphpmZsPVo5VvYUU+r4uhS/fnY11daDVU=;
        b=QCDZF16fh6jzu4BHubuekIpN6hjNySsz1lC9SVEXOGNEa7hB/BmNsYWimg3VtMmxwE
         fXY240EsfxjcvcVaVHw8fn1i8UXEFtIrNEg+m5dqyHRgQ2PC8suLC0LhTYjQ1pkQA5kS
         TYsfOaEk0zbyqnLfHJnOS3VtmA9xLrk4jIHNqqlspp6plZRgL4QRqcdqw3xLmfGYcfE2
         VibtazMap1mFT3r/gKSD0VuOKpQI4mbcLF5grMt3TtlzmnG3jlLYJl8gOEhhga5VkR0A
         tS/uR21bQjEeLKMrTadLQj7FBuUh8O+/6/WVUuCGp7Eo5RZ9vdxfxmGQIbN2Bpdn+nbg
         W/vw==
X-Gm-Message-State: AOAM532Yv9YAnNq4MhsKJlrQLD+MdYOl5dcEbLqBceOfcQww13UgKAaz
	2qDCwRGXDBrznrhkICkMGXFynA==
X-Google-Smtp-Source: ABdhPJx7uIPZ0aG5uMZD/IxkKfTuN1Jq6tEKtnFoS3QqqydDwNaNUdWON4uuqSHW5fx72tzKsMax+g==
X-Received: by 2002:a02:cd17:: with SMTP id g23mr2644168jaq.29.1632969129295;
        Wed, 29 Sep 2021 19:32:09 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id o9sm876691iob.15.2021.09.29.19.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 19:32:08 -0700 (PDT)
Subject: Re: [PATCH] nbd: use shifts rather than multiplies
To: Nick Desaulniers <ndesaulniers@google.com>,
 Josef Bacik <josef@toxicpanda.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Pavel Machek <pavel@ucw.cz>,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20210920232533.4092046-1-ndesaulniers@google.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <afad9679-79f2-7a18-0574-28e53b9d7aa3@kernel.dk>
Date: Wed, 29 Sep 2021 20:32:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210920232533.4092046-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a-Z-ZIXEQsE.A.9GF.pVSVhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1535
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/afad9679-79f2-7a18-0574-28e53b9d7aa3@kernel.dk
Resent-Date: Thu, 30 Sep 2021 02:48:09 +0000 (UTC)

On 9/20/21 5:25 PM, Nick Desaulniers wrote:
> commit fad7cd3310db ("nbd: add the check to prevent overflow in
> __nbd_ioctl()") raised an issue from the fallback helpers added in
> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and
> add fallback code")
> 
> ERROR: modpost: "__divdi3" [drivers/block/nbd.ko] undefined!
> 
> As Stephen Rothwell notes:
>   The added check_mul_overflow() call is being passed 64 bit values.
>   COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW is not set for this build (see
>   include/linux/overflow.h).
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

Applied, thanks.

-- 
Jens Axboe

